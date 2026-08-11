import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/routes.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, this.first});
  final String? first;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Sceen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.secondScreen, extra: " isthis second");
          },
          child: Text('Go to Second Screen ${widget.first}'),
        ),
      ),
    );
  }
}
