import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/auth/user_login.dart';
import 'package:nav_passdata/routes/routes.dart';
import 'package:nav_passdata/screens/broadcast_stream.dart';
import 'package:nav_passdata/screens/product_screen.dart';
import 'package:nav_passdata/screens/home_screen.dart';
import 'package:nav_passdata/screens/login_screen.dart';
import 'package:nav_passdata/screens/rx_stream.dart';
import 'package:nav_passdata/screens/stream_builder.dart';
import 'package:nav_passdata/screens/stream_screen.dart';
import 'package:nav_passdata/screens/userdetail_screen.dart';

class AppRoutes {
  /// The route configuration
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.secondScreen,

        builder: (BuildContext context, GoRouterState state) {
          String issec = state.extra.toString();
          return RxStream();
          // return SecondScreen(isSec: issec);
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
            path: Routes.productScreen,
            builder: (BuildContext context, GoRouterState state) {
              String isFirst = state.extra.toString();
              return ProductScreen(first: isFirst);
            },
          ),
          GoRoute(
            path: Routes.loginScreen,
            builder: (BuildContext context, GoRouterState state) {
              final isUser = state.extra as UserLogin;

              print(isUser);
              return LoginScreen(userLogin: isUser);
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
