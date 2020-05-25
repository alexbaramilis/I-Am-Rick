import 'package:flutter/material.dart';
import 'package:iamrick/utilities/constants.dart';
import 'package:alpha2_countries/alpha2_countries.dart';
import 'package:iamrick/components/error_alert.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String countryName;

  Future<void> showErrorAlert({String message, Function onRetry}) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ErrorAlert(
          errorMessage: message,
          onRetryButtonPressed: onRetry,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppBarMainTitle, style: kTextStyleAppBar),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: TextField(
            style: kTextStyleTextField,
            decoration: kInputDecorationTextField,
            cursorColor: kColourPrimary,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              countryName = value;
            },
            onEditingComplete: () {
              String countryCode = Countries().resolveCode(countryName);
              if (countryCode != null) {
                Navigator.pop(context, countryCode);
              } else {
                showErrorAlert(
                    message: 'No countries match.',
                    onRetry: () {
                      Navigator.of(context).pop();
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
