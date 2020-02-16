import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          title: Text('Walker Takedown'),
          backgroundColor: Colors.red[800],
        ),
        body: WalkerTakedown(),
      ),
    ),
  );
}

class WalkerTakedown extends StatefulWidget {
  @override
  _WalkerTakedownState createState() => _WalkerTakedownState();
}

class _WalkerTakedownState extends State<WalkerTakedown> {
  int humanImageIndex;
  int walkerImageIndex;

  Set usedHumanIndexes;
  Set usedWalkerIndexes;

  int humanStrength;
  int walkerStrength;

  int round;
  int humansRound;
  int walkersRound;

  int humansScore;
  int walkersScore;

  String winner;

  List humanStrengths = [8, 9, 10, 6, 7, 4, 5, 5, 4, 3];
  List walkerStrengths = [10, 9, 4, 6, 7, 5, 5, 3, 8, 4];

  List humanNames = [
    'NEGAN', // 8
    'MICHONNE', // 9
    'DARYL', // 10
    'CAROL', // 6
    'ROSITA', // 7
    'EUGENE', // 4
    'AARON', // 5
    'MAGNA', // 5
    'LUKE', // 4
    'JUDITH' // 3
  ];
  List walkerNames = [
    'ALPHA', // 10
    'BETA', // 9
    'WALKER #3', // 4
    'WALKER #4', // 6
    'WALKER #5', // 7
    'WALKER #6', // 5
    'WALKER #7', // 5
    'WALKER #8', // 3
    'WALKER #9', // 8
    'WALKER #10' // 4
  ];

  int randomHumanImageIndex() {
    int randomImageIndex = Random().nextInt(10) + 1;
    while (usedHumanIndexes.contains(randomImageIndex)) {
      randomImageIndex = Random().nextInt(10) + 1;
    }
    usedHumanIndexes.add(randomImageIndex);
    return randomImageIndex;
  }

  int randomWalkerImageIndex() {
    int randomImageIndex = Random().nextInt(10) + 1;
    while (usedWalkerIndexes.contains(randomImageIndex)) {
      randomImageIndex = Random().nextInt(10) + 1;
    }
    usedWalkerIndexes.add(randomImageIndex);
    return randomImageIndex;
  }

  int getHumanStrength() {
    return humanStrengths[humanImageIndex - 1];
  }

  int getWalkerStrength() {
    return walkerStrengths[walkerImageIndex - 1];
  }

  void updateScore() {
    if (humansRound == walkersRound) {
      round += 1;
      if (humanStrength > walkerStrength) {
        humansScore += 1;
      } else if (walkerStrength > humanStrength) {
        walkersScore += 1;
      }
      if (round == 10) {
        if (humansScore > walkersScore) {
          winner = 'HUMANS';
        } else if (walkersScore > humansScore) {
          winner = 'WALKERS';
        } else {
          winner = 'NO ONE';
        }
      }
    }
  }

  void newGame() {
    usedHumanIndexes = Set();
    usedWalkerIndexes = Set();
    humanImageIndex = randomHumanImageIndex();
    walkerImageIndex = randomWalkerImageIndex();
    humanStrength = getHumanStrength();
    walkerStrength = getWalkerStrength();
    round = 0;
    humansRound = 0;
    walkersRound = 0;
    humansScore = 0;
    walkersScore = 0;
    winner = '';
    updateScore();
  }

  @override
  void initState() {
    super.initState();
    newGame();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ROUND: $round / 10',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Writing You A Letter',
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    humanNames[humanImageIndex - 1],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Writing You A Letter',
                    ),
                  ),
                  FlatButton(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Image.asset(
                        'images/walker_takedown/human_$humanImageIndex.png'),
                    onPressed: () {
                      setState(() {
                        if (round == 10) {
                          newGame();
                        } else if (humansRound <= walkersRound) {
                          humansRound += 1;
                          humanImageIndex = randomHumanImageIndex();
                          humanStrength = getHumanStrength();
                          updateScore();
                        }
                      });
                    },
                  ),
                  Text(
                    'STRENGTH: $humanStrength',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Writing You A Letter',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'VS.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Writing You A Letter',
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    walkerNames[walkerImageIndex - 1],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Writing You A Letter',
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(8, 8, 16, 8),
                    child: Image.asset(
                        'images/walker_takedown/walker_$walkerImageIndex.png'),
                    onPressed: () {
                      setState(() {
                        if (round == 10) {
                          newGame();
                        } else if (walkersRound <= humansRound) {
                          walkersRound += 1;
                          walkerImageIndex = randomWalkerImageIndex();
                          walkerStrength = getWalkerStrength();
                          updateScore();
                        }
                      });
                    },
                  ),
                  Text(
                    'STRENGTH: $walkerStrength',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Writing You A Letter',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                (round < 10)
                    ? 'SCORE: $humansScore - $walkersScore'
                    : 'SCORE: $humansScore - $walkersScore\n\n$winner WON! TAP ON ANY CHARACTER TO PLAY AGAIN.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Writing You A Letter',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
