import 'package:flutter/material.dart';

void main() {
  runApp(IAmRick());
}

class IAmRick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          title: Text("I Am Rick"),
          backgroundColor: Colors.red[800],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/rick_profile.jpg'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Rick Grimes',
                style: TextStyle(
                  fontFamily: 'Dead Kansas',
                  fontSize: 36.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "FORMER SHERIFF'S DEPUTY AT CYNTHIANA POLICE DEPARTMENT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Writing You A Letter',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                color: Colors.brown[600],
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  title: Text(
                    'CHANNEL 4 ON THE WALKIE',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Writing You A Letter',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.brown[600],
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  title: Text(
                    'SEND BY HORSE TO ALEXANDRIA',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Writing You A Letter',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
