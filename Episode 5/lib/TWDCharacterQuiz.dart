import 'dart:convert';
import 'dart:math';

class TWDCharacterQuiz {
  Map _quizData;

  int _questionNumber = 1;
  int _totalQuestions = 10;

  List<int> _characterScores = [0, 0, 0, 0, 0, 0, 0];

  int _winnerIndex;

  TWDCharacterQuiz() {
    var jsonString = '''
      {"quiz_congratulations":"","questions":{"1":{"index":"1","text":"What is your walker slaying weapon of choice?","options":{"1":{"index":"1","text":"Katana","scores":{"286":"0","287":"0","288":"100","289":"0","290":"0","291":"0","292":"0"}},"2":{"index":"2","text":"Revolver","scores":{"286":"100","287":"60","288":"0","289":"0","290":"40","291":"0","292":"0"}},"3":{"index":"3","text":"Crossbow","scores":{"286":"0","287":"0","288":"0","289":"100","290":"0","291":"0","292":"0"}},"4":{"index":"4","text":"Hammer","scores":{"286":"0","287":"0","288":"0","289":"0","290":"0","291":"100","292":"20"}}}},"2":{"index":"2","text":"Least favorite \u201cThe Walking Dead\u201d villain:","options":{"1":{"index":"1","text":"The Governor","scores":{"286":"0","287":"0","288":"100","289":"60","290":"0","291":"0","292":"40"}},"2":{"index":"2","text":"Walkers","scores":{"286":"0","287":"0","288":"0","289":"0","290":"100","291":"60","292":"0"}},"3":{"index":"3","text":"Merle Dixon","scores":{"286":"0","287":"100","288":"0","289":"0","290":"0","291":"0","292":"0"}},"4":{"index":"4","text":"Shane Walsh","scores":{"286":"100","287":"0","288":"0","289":"0","290":"0","291":"0","292":"0"}}}},"3":{"index":"3","text":"Pick a zombie movie:","options":{"1":{"index":"1","text":"\u201cShaun of the Dead\u201d","scores":{"286":"0","287":"100","288":"0","289":"0","290":"0","291":"60","292":"0"}},"2":{"index":"2","text":"\u201cEvil Dead\u201d","scores":{"286":"0","287":"0","288":"0","289":"100","290":"0","291":"0","292":"0"}},"3":{"index":"3","text":"\u201cResident Evil\u201d","scores":{"286":"0","287":"0","288":"100","289":"0","290":"60","291":"0","292":"0"}},"4":{"index":"4","text":"\u201c28 Days Later\u201d","scores":{"286":"60","287":"0","288":"0","289":"0","290":"0","291":"0","292":"100"}}}},"4":{"index":"4","text":"Which would you choose for your last meal?","options":{"1":{"index":"1","text":"PB & J","scores":{"286":"40","287":"0","288":"0","289":"0","290":"100","291":"0","292":"0"}},"2":{"index":"2","text":"Sushi","scores":{"286":"0","287":"0","288":"100","289":"60","290":"0","291":"0","292":"0"}},"3":{"index":"3","text":"Pizza","scores":{"286":"0","287":"100","288":"0","289":"0","290":"0","291":"60","292":"0"}},"4":{"index":"4","text":"Brains!","scores":{"286":"0","287":"0","288":"0","289":"0","290":"0","291":"0","292":"100"}}}},"5":{"index":"5","text":"Which is most important during a zombie invasion?","options":{"1":{"index":"1","text":"Bullets","scores":{"286":"100","287":"0","288":"0","289":"0","290":"60","291":"0","292":"0"}},"2":{"index":"2","text":"Food and water","scores":{"286":"0","287":"0","288":"0","289":"40","290":"0","291":"0","292":"0"}},"3":{"index":"3","text":"Shelter","scores":{"286":"0","287":"0","288":"0","289":"0","290":"0","291":"100","292":"40"}},"4":{"index":"4","text":"Medicine","scores":{"286":"0","287":"100","288":"60","289":"0","290":"0","291":"0","292":"0"}}}},"6":{"index":"6","text":"Pick a dance trend:","options":{"1":{"index":"1","text":"Michael Jackson\u2019s \u201cThriller\u201d","scores":{"286":"20","287":"0","288":"0","289":"0","290":"0","291":"0","292":"100"}},"2":{"index":"2","text":"The Soulja Boy","scores":{"286":"0","287":"100","288":"0","289":"0","290":"20","291":"0","292":"0"}},"3":{"index":"3","text":"Twerking","scores":{"286":"0","287":"0","288":"100","289":"0","290":"0","291":"0","292":"0"}},"4":{"index":"4","text":"Harlem Shake","scores":{"286":"0","287":"0","288":"0","289":"100","290":"0","291":"20","292":"0"}}}},"7":{"index":"7","text":"Pick a place to live during a zombie apocalypse:","options":{"1":{"index":"1","text":"A prison","scores":{"286":"100","287":"0","288":"0","289":"0","290":"0","291":"0","292":"0"}},"2":{"index":"2","text":"An abandoned town","scores":{"286":"0","287":"0","288":"0","289":"0","290":"0","291":"100","292":"20"}},"3":{"index":"3","text":"In the woods","scores":{"286":"0","287":"0","288":"60","289":"100","290":"0","291":"0","292":"0"}},"4":{"index":"4","text":"On a beach","scores":{"286":"0","287":"100","288":"0","289":"0","290":"60","291":"0","292":"0"}}}},"8":{"index":"8","text":"One thing you\u2019d miss the most during a zombie invasion:","options":{"1":{"index":"1","text":"The Internet","scores":{"286":"0","287":"100","288":"0","289":"0","290":"0","291":"0","292":"0"}},"2":{"index":"2","text":"Friends and family","scores":{"286":"0","287":"0","288":"40","289":"0","290":"100","291":"0","292":"0"}},"3":{"index":"3","text":"The Red Sox","scores":{"286":"0","287":"0","288":"0","289":"0","290":"0","291":"60","292":"100"}},"4":{"index":"4","text":"Rule of law","scores":{"286":"100","287":"0","288":"0","289":"40","290":"0","291":"0","292":"0"}}}},"9":{"index":"9","text":"Which \u201cThe Walking Dead\u201d character do you miss the most?","options":{"1":{"index":"1","text":"Dale Horvath","scores":{"286":"100","287":"0","288":"0","289":"0","290":"0","291":"0","292":"60"}},"2":{"index":"2","text":"Andrea","scores":{"286":"0","287":"0","288":"100","289":"20","290":"0","291":"0","292":"0"}},"3":{"index":"3","text":"Lori Grimes","scores":{"286":"0","287":"0","288":"0","289":"0","290":"100","291":"0","292":"0"}},"4":{"index":"4","text":"Herschel Greene","scores":{"286":"0","287":"100","288":"0","289":"0","290":"0","291":"40","292":"0"}}}},"10":{"index":"10","text":"If you could have one of these super powers which would it be:","options":{"1":{"index":"1","text":"Time traveling","scores":{"286":"60","287":"100","288":"0","289":"0","290":"0","291":"0","292":"0"}},"2":{"index":"2","text":"Flying","scores":{"286":"0","287":"0","288":"40","289":"0","290":"0","291":"0","292":"100"}},"3":{"index":"3","text":"Invincibility","scores":{"286":"0","287":"0","288":"0","289":"20","290":"0","291":"100","292":"0"}},"4":{"index":"4","text":"Super strength","scores":{"286":"0","287":"0","288":"0","289":"0","290":"100","291":"0","292":"0"}}}}},"outcomes":{"286":{"id":"286","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_rick.jpg","name":"Rick Grimes","tease":"","text":"You're a natural born leader who would do anything for your family and friends. While you may feel overwhelmed at times (who wouldn't in a zombie invasion?), you always find a way to win."},"287":{"id":"287","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_glenn.jpg","name":"Glenn Rhee","tease":"","text":"You're clever and creative in the field, but also kind at heart. Your significant other is the most important person in your life, but if a stranger is in need, you'd gladly put your life on the line."},"288":{"id":"288","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_michonne.jpg","name":"Michonne","tease":"","text":"You're strong, fierce, and definitely not afraid of a fight. Whether it's facing down walkers or a maniacal governor, you won't let anything get in your way."},"289":{"id":"289","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_daryl.jpg","name":"Daryl Dixon","tease":"","text":"You're reliable and resourceful. While people may think you're a bit shy and rough around the edges, they know that they can always count on you to have their backs."},"290":{"id":"290","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_carl.jpg","name":"Carl Grimes","tease":"","text":"You've seen a lot at a young age, but you're still good-natured (for the most part) and full of energy. While your emotions may get the better of you at times, you always have people's best interests at heart."},"291":{"id":"291","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_tyreese.jpg","name":"Tyreese","tease":"","text":"You're a hard worker and have a strong sense of right and wrong. People come to you as a source of strength because they know you have what it takes to get the job done."},"292":{"id":"292","image":"http:\/\/cache.boston.com\/stuff\/2014\/02\/06\/rsz_walker.jpg","name":"A walker","tease":"","text":"You have a carefree attitude and are always in the mood to party with others (usually fellow walkers). Terrorizing townspeople is your typical idea of a fun Friday night -- it's just how you roll -- but you don't mind a nice quiet meal at home either (brains a la carte anyone?)."}}}
    ''';
    _quizData = jsonDecode(jsonString);
  }

  int getTotalNumberOfQuestions() {
    return _totalQuestions;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  String getQuestionText() {
    return _quizData['questions']['$_questionNumber']['text'];
  }

  String getAnswerText({int option}) {
    return _quizData['questions']['$_questionNumber']['options']['$option']
        ['text'];
  }

  void nextQuestion() {
    _questionNumber++;
  }

  void updateScores({int optionPicked}) {
    for (int i = 0; i < 7; i++) {
      _characterScores[i] += int.parse(_quizData['questions']
              ['$_questionNumber']['options']['$optionPicked']['scores']
          ['${286 + i}']);
    }
  }

  bool isFinished() {
    if (_questionNumber == _totalQuestions) {
      return true;
    } else {
      return false;
    }
  }

  void calculateResults() {
    int maxScore = _characterScores.reduce(max);
    _winnerIndex = _characterScores.indexOf(maxScore);
  }

  String getWinnerImageURL() {
    return _quizData['outcomes']['${286 + _winnerIndex}']['image'];
  }

  String getWinnerName() {
    return _quizData['outcomes']['${286 + _winnerIndex}']['name'];
  }

  String getWinnerText() {
    return _quizData['outcomes']['${286 + _winnerIndex}']['text'];
  }

  void reset() {
    _questionNumber = 1;
    _characterScores = [0, 0, 0, 0, 0, 0, 0];
  }
}
