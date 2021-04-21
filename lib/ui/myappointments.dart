import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppointment extends StatefulWidget {
  static const id = 'myAppointments';
  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("myappointments".tr().toString()),
      // ),
      body: Text(""),
    );
  } // end build

//------------------------------------------------------------------------------
} // end class
//done
