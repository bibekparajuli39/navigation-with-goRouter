import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  String message = '';
  // final StreamController<String> _streamController = StreamController<String>();
  final StreamController<String> _streamController =
      StreamController<String>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Builder Screen")),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              _streamController.sink.add(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          StreamBuilder(
            stream: _streamController.stream,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text('typing something');
              }
            }),
          ),
          StreamBuilder(
            stream: _streamController.stream,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text("Typing");
              }
            }),
          ),
        ],
      ),
    );
  }
}
