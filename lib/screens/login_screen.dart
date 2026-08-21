// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nav_passdata/model/product/auth/user_login.dart';
import 'package:nav_passdata/network/api_end_point.dart';

import 'package:nav_passdata/routes/routes.dart';
import 'package:nav_passdata/services/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.userLogin}) : super(key: key);
  final UserLogin userLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  final Dio dio = Dio();
  // fetching data from api
  @override
  void initState() {
    usernameController = TextEditingController(text: widget.userLogin.username);
    passwordController = TextEditingController(text: widget.userLogin.password);

    // TODO: implement initState
    super.initState();
  }

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
            // initialValue: widget.userLogin.username,
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          TextFormField(
            // initialValue: widget.userLogin.password,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              var username = widget.userLogin.username.trim();
              var password = widget.userLogin.password.trim();

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
    // final response = await dio.post(
    //   "https://fakestoreapi.com/auth/login",
    //   data: userDetails.toMap(),
    // );
    final response = await ApiService().post(
      ApiEndPoint.login,
      data: userDetails.toMap(),
    );
    var data = response.statusCode;
    var datauser = response.data;
    print(datauser);
    print(data);
  }
}
