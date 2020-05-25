import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';

class AuthForm extends StatefulWidget {
  final bool isSignIn;
  final Function onFormSubmitted;

  AuthForm({
    @required this.isSignIn,
    @required this.onFormSubmitted,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kAppTitle, style: kTextStyleAppTitle)),
      body: SafeArea(
        child: Padding(
          padding: kPaddingSafeArea,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset('images/walkie.png'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                widget.isSignIn ? 'SIGN IN' : 'REGISTER',
                style: kTextStyleTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: kTextStyleFormTextField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter your email',
                        hintStyle: kTextStyleFormHint,
                      ),
                      validator: (String value) {
                        return value.contains('@')
                            ? null
                            : 'You\'re missing an @.';
                      },
                      onChanged: (String value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      style: kTextStyleFormTextField,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter your password',
                        hintStyle: kTextStyleFormHint,
                      ),
                      validator: (String value) {
                        return value.length < 6
                            ? 'Use at least 6 characters!'
                            : null;
                      },
                      onChanged: (String value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 30.0),
                    RaisedButton(
                      child: Text(
                        widget.isSignIn ? 'Sign In' : 'Register',
                        style: kTextStyleFormButton,
                      ),
                      padding: kPaddingFormButton,
                      color: kColourPrimary,
                      onPressed: () async {
                        FormState formState = Form.of(primaryFocus.context);
                        if (formState != null && formState.validate()) {
                          widget.onFormSubmitted(email, password);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
