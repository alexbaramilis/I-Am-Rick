import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iamrick/components/microphone.dart';
import 'package:iamrick/components/recordings_stream.dart';

class WalkieScreen extends StatefulWidget {
  static const String id = 'walkie_screen';

  @override
  _WalkieScreenState createState() => _WalkieScreenState();
}

class _WalkieScreenState extends State<WalkieScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isRecording ? kColourIsRecording : kColourPrimary,
      appBar: AppBar(
        title: Text(kAppTitle, style: kTextStyleAppTitle),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out', style: kTextStyleLogOutButton),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: kColourBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RecordingsStream(),
              Microphone(
                isRecording: isRecording,
                onStartRecording: () {
                  setState(() {
                    isRecording = true;
                  });
                },
                onStopRecording: () {
                  setState(() {
                    isRecording = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
