import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Microphone extends StatelessWidget {
  final bool isRecording;
  final Function onStartRecording;
  final Function onStopRecording;

  Microphone({
    @required this.isRecording,
    @required this.onStartRecording,
    @required this.onStopRecording,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 96.0,
        color: isRecording ? kColourIsRecording : kColourPrimary,
        child: Icon(
          Icons.mic,
          size: 48.0,
          color: Colors.white,
        ),
      ),
      onTapDown: (TapDownDetails details) {
        startRecording();
      },
      onTapUp: (TapUpDetails details) {
        stopRecording();
      },
    );
  }

  void startRecording() async {
    try {
      if (await hasPermissions()) {
        onStartRecording();
        String path = await getFilePath();
        await AudioRecorder.start(
          path: path,
          audioOutputFormat: AudioOutputFormat.AAC,
        );
      }
    } catch (error) {
      print(error);
    }
  }

  void stopRecording() async {
    if (isRecording) {
      onStopRecording();
      var recording = await AudioRecorder.stop();
      sendRecording(recording.path);
    }
  }

  void sendRecording(String path) {
    final fileName = path.split('/').last;
    FirebaseStorage.instance.ref().child(fileName).putFile(File(path));
    Firestore.instance.collection('walkie').add({'filename': fileName});
  }

  Future<bool> hasPermissions() async {
    var status = await Permission.microphone.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
        Permission.microphone.request();
        break;
      case PermissionStatus.restricted:
        print('Microphone access is restricted. You cannot use this app.');
        break;
      case PermissionStatus.permanentlyDenied:
        print('Microsoft access is permanently denied. '
            'You have to go to Settings to enable it.');
        break;
    }
    return false;
  }

  Future<String> getFilePath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    String timestamp = DateTime.now().toIso8601String();
    return appDocDirectory.path + '/recording_' + timestamp + '.m4a';
  }
}
