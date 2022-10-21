
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/all_data/all_data_bloc.dart';
import 'package:jonathans_technical_test/domain/entities/album.dart';
import 'package:jonathans_technical_test/domain/entities/photo.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {

    
    final Album album = ModalRoute.of(context)!.settings.arguments as Album;
    final allDataBloc = BlocProvider.of<AllDataBloc>(context);

    final List<Widget> photoCards = [];
    for ( int i=0; i<allDataBloc.state.photos.length; i++ ) {
      if ( album.id == allDataBloc.state.photos[i].albumId ) {
        photoCards.add(
            _PhotoCard( photo: allDataBloc.state.photos[i],)
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              children: photoCards,
          ),
        ),
      ),
    );
  }
}


class _PhotoCard extends StatelessWidget {

  final Photo photo;

  const _PhotoCard({required this.photo});

  @override
  Widget build(BuildContext context) {

    return Card(
      // color: Colors.green,
      margin: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
        child: Container(
          margin: const EdgeInsets.symmetric( vertical: 5 ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('loading.gif'),
                  image: NetworkImage(photo.url),
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox( height: 5 ),

              Text(
                photo.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle( fontSize: 12 ),
              )
            ],
          ),
        ),
    );
  }
}