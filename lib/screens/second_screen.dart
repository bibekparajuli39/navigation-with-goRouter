import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/routes.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, this.isSec});
  final String? isSec;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondScreen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.thirdScreen);
          },
          child: Text('Go to ThirdScreen -> ${widget.isSec}'),
        ),
      ),
    );
  }
}
