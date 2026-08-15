import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/auth/user_login.dart';

import 'package:nav_passdata/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Dio dio = Dio();
  // fetching data from api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginScreen')),
      body: Column(
        spacing: 20,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                context.go(Routes.homeScreen, extra: "isLogin true");
              },
              child: Text('Go to HomeScreen'),
            ),
          ),

          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              var username = usernameController.text.trim();
              var password = passwordController.text.trim();

              print("username is $username and password is $password");
              var userDetails = UserLogin(
                username: username,
                password: password,
              );
              login(userDetails);
            },
            child: Text("Login"),
          ),

          // product list is shown here
        ],
      ),
    );
  }

  Future login(UserLogin userDetails) async {
    final response = await dio.post(
      "https://fakestoreapi.com/auth/login",
      data: userDetails.toMap(),
    );
    var data = response.statusCode;
    print(data);
  }
}
