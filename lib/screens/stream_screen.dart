import 'dart:async';

import 'package:flutter/material.dart';

// Single subscriber Stream

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  String message = '';
  final StreamController _streamController = StreamController();

  @override
  void initState() {
    // TODO: implement initState
    _streamController.stream.listen((data) {
      setState(() {
        message = data.toString().toUpperCase();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }
  // String message = '';
  // final StreamController<String> _streamController = StreamController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _streamController.stream.listen((data) {
  //     setState(() {
  //       message = data.toUpperCase();
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _streamController.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Subscription Stream')),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              _streamController.sink.add(value);
            },
            // onChanged: (value) {
            //   // _streamController.sink.add(value);
            // },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Text("Message $message"),
        ],
      ),
    );
  }
}
