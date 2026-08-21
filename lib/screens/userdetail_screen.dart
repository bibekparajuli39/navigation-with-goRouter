import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/auth/user_login.dart';
import 'package:nav_passdata/model/user_details/user_details.dart';
import 'package:nav_passdata/routes/routes.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, this.isSec});
  final String? isSec;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<UserDetails> user = [];
  final Dio dio = Dio();
  bool isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondScreen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.thirdScreen);
          },
          child: Column(
            children: [
              Text('Go to ThirdScreen -> ${widget.isSec}'),

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,

                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(user[index].username);
                        var userLogin = UserLogin(
                          username: user[index].username.toString(),
                          password: user[index].password.toString(),
                        );
                        context.go(Routes.loginScreen, extra: userLogin);
                      },
                      child: isloading
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.only(left: 30),
                              child: Column(
                                children: [
                                  Row(
                                    spacing: 20,
                                    children: [
                                      CircleAvatar(
                                        child: Text(user[index].id.toString()),
                                      ),

                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: .start,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                user[index].name!.firstname
                                                    .toString(),
                                              ),
                                              Text(
                                                user[index].name!.lastname
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getUser() async {
    try {
      isloading = true;
      final response = await dio.get("https://fakestoreapi.com/users");
      final data = response.statusCode;
      final List dataStore = response.data;
      user = dataStore.map((e) => UserDetails.fromMap(e)).toList();
      if (mounted) {
        setState(() {});
      }
      print(data);
    } catch (e) {
      print(e);
    } finally {
      isloading = false;
      setState(() {});
    }
  }
}
