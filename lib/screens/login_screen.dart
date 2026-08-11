import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/app_routes.dart';
import 'package:nav_passdata/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginScreen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.homeScreen, extra: "isLogin true");
          },
          child: Text('Go to HomeScreen'),
        ),
      ),
    );
  }
}
