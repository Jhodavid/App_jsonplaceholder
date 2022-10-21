
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/all_data/all_data_bloc.dart';
// import 'package:jonathans_technical_test/domain/blocs/album/album_bloc.dart';
import 'package:jonathans_technical_test/domain/blocs/ui/ui_bloc.dart';
// import 'package:jonathans_technical_test/domain/blocs/user/user_bloc.dart';

import 'package:jonathans_technical_test/ui/routes_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider( create: ( context ) => UiBloc() ),
        BlocProvider( create: ( context ) => AllDataBloc() ),
        // BlocProvider(create: ( context ) => AlbumBloc() ),
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
