import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          title: Text("I Am Rick"),
          backgroundColor: Colors.red[800],
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/rick_gun.jpg'),
          ),
        ),
      ),
    ),
  );
}
