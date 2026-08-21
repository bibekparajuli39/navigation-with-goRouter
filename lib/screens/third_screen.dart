import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/routes/routes.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.productScreen);
          },
          child: Text('Go to HomeScreen '),
        ),
      ),
    );
  }
}
