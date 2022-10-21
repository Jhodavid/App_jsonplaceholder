import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/all_data/all_data_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final allDataBloc = BlocProvider.of<AllDataBloc>(context);
    allDataBloc.checkData().then((value) {
      if ( value ) Navigator.pushReplacementNamed(context, 'home');
    },);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(bottom: 20),
                child: const CircularProgressIndicator()),
          ),
          BlocBuilder<AllDataBloc, AllDataState>(
            builder: (context, state) {
              return Center(
                child: Text( state.loadingState, textAlign: TextAlign.center ),
              );
            },
          )
        ],
      ),
    );
  }
}
