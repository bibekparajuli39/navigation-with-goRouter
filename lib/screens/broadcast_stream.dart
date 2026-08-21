import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStream extends StatefulWidget {
  const BroadcastStream({super.key});

  @override
  State<BroadcastStream> createState() => _BroadcastStreamState();
}

class _BroadcastStreamState extends State<BroadcastStream> {
  String message1 = '';
  String message2 = 'Good Morning';
  final StreamController<String> _broadcastController =
      StreamController.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    _broadcastController.stream.listen((data) {
      setState(() {});
      message1 = data;
    });
    _broadcastController.stream.listen((data) {
      setState(() {});
      message2 = data.toUpperCase();
    });
    super.initState();
  }

  // String message = '';
  // String message2 = '';
  // final StreamController<String> _broadcastController =
  //     StreamController<String>.broadcast();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _broadcastController.stream.listen((data) {
  //     setState(() {
  //       message = data;
  //     });
  //   });
  //   _broadcastController.stream.listen((data) {
  //     setState(() {
  //       message2 = data.toUpperCase();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BroadCast Stream")),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              _broadcastController.sink.add(value);
            },
            // onChanged: (value) {
            //   _broadcastController.sink.add(value);
            // },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Text('Message1 $message1'),
          Text('Message2 $message2'),
          // Text('Message1 $message'),
          // Text('Message2 $message2'),
        ],
      ),
    );
  }
}
