import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/all_data/all_data_bloc.dart';
import 'package:jonathans_technical_test/domain/entities/user.dart';
import 'package:jonathans_technical_test/ui/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final allDataBloc = BlocProvider.of<AllDataBloc>(context);
    
    final List<Widget> usersCards = [];
    for ( int i=0; i<allDataBloc.state.users.length; i++ ) {
      usersCards.add(
          _UserCard( user: allDataBloc.state.users[i],)
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height*0.1),
        child: const TechnicalAppBar( title: 'Prueba Ténica AntPack', subTitle: 'Jonathan Poveda', ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only( top: height*0.008, left: width*0.01, right: width*0.01 ),
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: usersCards,
            ),
          ),
        )
      ),
    );
  }
}

class _UserCard extends StatelessWidget {

  final User user;

  const _UserCard({
    required this.user
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'user', arguments: user );
      },
      child: Padding(
        padding: EdgeInsets.all( width*0.01 ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(width*0.015),
                child: Text(user.name, style: TextStyle(
                  fontSize: width*0.037,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 70, 70, 70)
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.all(width*0.015),
                child: Text('Email:', maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 68, 255)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left:  width*0.015 ),
                child: Text(user.email, maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.all(width*0.015),
                child: Text('Ciudad:', maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 68, 255)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left:  width*0.015 ),
                child: Text(user.address.city, maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.all(width*0.015),
                child: Text('Compañía:', maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 68, 255)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left:  width*0.015 ),
                child: Text(user.company.name, maxLines: 2, style: TextStyle(
                  fontSize: width*0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}