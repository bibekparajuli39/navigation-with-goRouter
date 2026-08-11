import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/routes.dart';
import 'package:nav_passdata/screens/first_screen.dart';
import 'package:nav_passdata/screens/home_screen.dart';
import 'package:nav_passdata/screens/login_screen.dart';
import 'package:nav_passdata/screens/second_screen.dart';

class AppRoutes {
  /// The route configuration
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.homeScreen,

            builder: (BuildContext context, GoRouterState state) {
              String isLogin = state.extra.toString();
              return HomeScreen(islogin: isLogin);
            },
          ),
          GoRoute(
            path: Routes.firstScreen,
            builder: (BuildContext context, GoRouterState state) {
              String isFirst = state.extra.toString();
              return FirstScreen(first: isFirst);
            },
          ),
          GoRoute(
            path: Routes.secondScreen,

            builder: (BuildContext context, GoRouterState state) {
              String issec = state.extra.toString();
              return SecondScreen(isSec: issec);
            },
          ),
        ],
      ),
    ],

    // error pahebuilder
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Center(child: Text("hello Someting went wrong")),
      );
    },
  );
}
