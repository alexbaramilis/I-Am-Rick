import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(ChristmasJams());

class ChristmasJams extends StatelessWidget {
  void playTrack(String filename) {
    final player = AudioCache(prefix: 'christmas_jams/');
    player.play(filename);
  }

  Align buildTrack({String filename, String trackName}) {
    return Align(
      child: FlatButton.icon(
        onPressed: () {
          playTrack(filename);
        },
        icon: Icon(Icons.play_circle_filled),
        label: Flexible(
          child: Text(trackName),
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          title: Text("Rick's Christmas Jams"),
          backgroundColor: Colors.red[800],
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 16.0),
            children: <Widget>[
              buildTrack(
                  filename: '1_Nutcracker_Dance_of_the_Sugar_Plum_Fairy.mp3',
                  trackName:
                      '1) Nutcracker - Dance of the Sugar Plum Fairy.mp3'),
              buildTrack(
                  filename: '2_O_Holy_Night.mp3',
                  trackName: '2) O Holy Night.mp3'),
              buildTrack(
                  filename: '3_God_Rest_Ye_Merry_Gentlemen.mp3',
                  trackName: '3) God Rest Ye Merry Gentlemen.mp3'),
              buildTrack(
                  filename: '4_Silent_Night.mp3',
                  trackName: '4) Silent Night.mp3'),
              buildTrack(
                  filename: '5_What_Child_Is_This_Greensleeves.mp3',
                  trackName: '5) What Child Is This (Greensleeves).mp3'),
              buildTrack(
                  filename: '6_Hark_The_Herald_Angels_Sing.mp3',
                  trackName: '6) Hark The Herald Angels Sing.mp3'),
              buildTrack(
                  filename: '7_O_Little_Town_of_Bethlehem.mp3',
                  trackName: '7) O Little Town of Bethlehem.mp3'),
              buildTrack(
                  filename: '8_Oh_Come_Oh_Come_Emmanuel.mp3',
                  trackName: '8) Oh Come Oh Come Emmanuel.mp3'),
              buildTrack(
                  filename: '9_O_Come_All_Ye_Faithful.mp3',
                  trackName: '9) O Come All Ye Faithful.mp3'),
              buildTrack(
                  filename: '10_Away_In_The_Manger.mp3',
                  trackName: '10) Away In The Manger.mp3'),
            ],
          ),
        ),
      ),
    );
  }
}
