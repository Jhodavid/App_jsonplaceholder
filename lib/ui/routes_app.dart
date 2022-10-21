import 'package:flutter/material.dart';
import 'package:jonathans_technical_test/domain/entities/router_option.dart';
import 'package:jonathans_technical_test/ui/pages/home/home_page.dart';
import 'package:jonathans_technical_test/ui/pages/loading/loading_page.dart';

class AppRoutes {
  
  static const initialRoute = 'loading';

  static final routerOptions = <RouterOption>[
    RouterOption( route: 'loading', page: const LoadingPage() ),
    RouterOption( route: 'home', page: const HomePage() ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for( final option in routerOptions) {
      appRoutes.addAll({ option.route : ( BuildContext context ) => option.page });
    }

    return appRoutes;
  }
}