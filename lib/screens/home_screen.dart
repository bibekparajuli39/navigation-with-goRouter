import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.islogin});
  final String? islogin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.firstScreen, extra: "isthis first");
          },
          child: Text('Go to FirstScreen -> ${widget.islogin}'),
        ),
      ),
    );
  }
}
