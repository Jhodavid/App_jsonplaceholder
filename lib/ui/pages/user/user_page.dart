import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/all_data/all_data_bloc.dart';
import 'package:jonathans_technical_test/domain/entities/album.dart';
import 'package:jonathans_technical_test/domain/entities/user.dart';
import 'package:jonathans_technical_test/ui/widgets/app_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    final User user = ModalRoute.of(context)!.settings.arguments as User;
    final allDataBloc = BlocProvider.of<AllDataBloc>(context);

    final List<Album> albums = [];
    for ( int i=0; i<allDataBloc.state.albums.length; i++ ) {
      if ( allDataBloc.state.albums[i].userId == user.id ) albums.add( allDataBloc.state.albums[i] );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height*0.1),
        child: TechnicalAppBar( title: user.name, subTitle: user.username,),
      ),
      body: Column(
        children: [
          _InfoUser(user: user),
          Expanded(
            child: ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {

                return ListTile(
                  leading: Text('${albums[index].id}'),
                  title: Text(albums[index].title),
                  onTap: () {
                    Navigator.pushNamed(context, 'photos', arguments: albums[index] );
                  },
                );
              },
            )
          )
        ]
      ),
    );
  }
}



class _InfoUser extends StatelessWidget {
  const _InfoUser({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all( width*0.01 ),
      child: Column(
        children: [

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Text('Email:', style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 68, 255)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:  width*0.015 ),
                    child: Text(user.email, maxLines: 2, style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Text('Dirección:', style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 68, 255)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:  width*0.015 ),
                    child: Text('${user.address.street} ${user.address.suite}, ${user.address.city}', maxLines: 2, style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Text('Phone:', style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 68, 255)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:  width*0.015 ),
                    child: Text(user.phone, maxLines: 2, style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(width*0.015),
                    child: Text('Web Site:', style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 68, 255)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:  width*0.015 ),
                    child: Text('${user.address.street} ${user.address.suite}, ${user.address.city}', maxLines: 2, style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:  width*0.015 ),
                    child: Text(user.address.city, maxLines: 2, style: TextStyle(
                      fontSize: width*0.029,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only( top: height*0.03),
            child: Text('Álbunes', style: TextStyle(
              fontSize: width*0.037,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 70, 70, 70)
              ),
            ),
          ),

        ],
        
      ),
    );
  }
}