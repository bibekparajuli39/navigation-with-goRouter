// rxactive and type it changes according situation

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxStream extends StatefulWidget {
  const RxStream({super.key});

  @override
  State<RxStream> createState() => _RxStreamState();
}

class _RxStreamState extends State<RxStream> {
  final publishSubject =
      PublishSubject<
        String
      >(); //no history like radio playing it has no past record
  final behaviorSubject =
      BehaviorSubject<String>(); // last login user data ,last conversion

  final replaySubject =
      ReplaySubject<String>(); //hd drive with cct or report that save all data
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rx Stream All subject')),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // send message to all subject
            },

            child: Text('Send to all'),
          ),
          StreamBuilder(
            stream: publishSubject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Message from publishSubject ${snapshot.data}');
              } else {
                return Text("publishSubject");
              }
            },
          ),
          StreamBuilder(
            stream: behaviorSubject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Message from behaviorSubject ${snapshot.data}');
              } else {
                return Text("behaviorSubject");
              }
            },
          ),
          StreamBuilder(
            stream: replaySubject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Message from replaySubject ${snapshot.data}');
              } else {
                return Text("replaySubject");
              }
            },
          ),
        ],
      ),
    );
  }
}
