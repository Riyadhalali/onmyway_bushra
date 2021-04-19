import 'package:flutter/material.dart';

class LanguageSelect extends StatefulWidget {
  static String id = 'language_select';
  @override
  _LanguageSelectState createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(
          "hello My Beautiful friend bushra ",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
