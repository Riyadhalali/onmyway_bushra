import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*
this page is for provided services
*/

/*
best practicle is to how to use  the refresh indicator is like this:
1- when we call the  set state is will call the initstate function so for
refreshing when user swip down we call inside the refresh indicator function
just setstate function for updating widget and because the set state will update the
build and call the init state we call the fetchuser


 */

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
//{
  //----------------------------------------------------------------------------
  DateTime
      currentBackPressButton; // varaiable to hold the date and time for exit button

  int counter = 0;
  bool keepAlive = true;
  Future myFuture; // if we want the future to build just one

//------------------------------fetch List--------------------------------------

//------------------------------POP Screen--------------------------------------
  Future<bool> onExitButton() {
    DateTime now = DateTime.now();
    if (currentBackPressButton == null ||
        now.difference(currentBackPressButton) > Duration(seconds: 2)) {
      currentBackPressButton = now;
      Fluttertoast.showToast(
          msg: "exit_warning".tr().toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true); // to exit program
  }
  //----------------------------------------------------------------------------

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => keepAlive;
  @override
  void initState() {
    // TODO: implement initState
    ///  myFuture = fetchList(); // if we want the future builds just one

    super.initState();
    //fetchList();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(body: Text(""));
  } // end build

//--------------------------Provided Service List-------------------------------

//------------------------------------------------------------------------------
} // end class
//done
