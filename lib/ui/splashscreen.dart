import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ColumnElement(),
      ),
    );
  } // end build

  //---------------------------------Widget Tree------------------------
  Widget ColumnElement() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        imageBackground(),
      ],
    );
  }

  //---------------------------------------------------
  Widget imageBackground() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          image: DecorationImage(
              image: AssetImage('assets/ui/splashscreen/appicon.png'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
//----------------------------------------------------------------
} //end class
