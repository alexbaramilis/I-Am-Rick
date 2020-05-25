import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:iamrick/screens/register_screen.dart';
import 'package:iamrick/screens/signin_screen.dart';
import 'package:iamrick/screens/walkie_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey _keyParentColumn = GlobalKey();
  GlobalKey _keyChildColumn = GlobalKey();
  double _walkieHeight = 0.0;

  AnimationController controller;
  Animation animationBounce;
  Animation animationColour;

  @override
  void initState() {
    super.initState();
    determineAuthStatus();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    setupAnimations();
  }

  void determineAuthStatus() async {
    try {
      final user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        Navigator.pushNamed(context, WalkieScreen.id);
      }
    } catch (error) {
      print(error);
    }
  }

  _afterLayout(_) {
    _walkieHeight =
        heightOfWidget(_keyParentColumn) - heightOfWidget(_keyChildColumn);
  }

  double heightOfWidget(GlobalKey key) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  void setupAnimations() {
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationBounce = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    );
    animationColour = ColorTween(
      begin: Colors.black,
      end: kColourBackground,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  Widget buildAnimatedWelcomeText() {
    String welcomeText = 'Welcome to Walkie';
    int durationInSeconds = 1; // total duration of the animation
    int millisecondInterval = (durationInSeconds * 1000 / (welcomeText.length))
        .round(); // duration of each character
    if (controller.status == AnimationStatus.completed) {
      return TyperAnimatedTextKit(
        text: [welcomeText],
        textStyle: kTextStyleTitle,
        textAlign: TextAlign.center,
        isRepeatingAnimation: false,
        speed: Duration(milliseconds: millisecondInterval),
      );
    } else {
      return Text(
        '',
        style: kTextStyleTitle,
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationColour.value,
      appBar: AppBar(title: Text(kAppTitle, style: kTextStyleAppTitle)),
      body: SafeArea(
        child: Padding(
          padding: kPaddingSafeArea,
          child: Column(
            key: _keyParentColumn,
            children: <Widget>[
              Container(
                height: _walkieHeight,
                alignment: Alignment.center,
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/walkie.png'),
                    height: _walkieHeight * animationBounce.value,
                  ),
                ),
              ),
              Column(
                key: _keyChildColumn,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 30),
                  buildAnimatedWelcomeText(),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Sign In', style: kTextStyleFormButton),
                    padding: kPaddingFormButton,
                    color: kColourPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    child: Text('Register', style: kTextStyleFormButton),
                    padding: kPaddingFormButton,
                    color: kColourPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
