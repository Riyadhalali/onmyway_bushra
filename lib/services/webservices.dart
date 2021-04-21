import 'dart:convert';

import 'package:alatareekeh/constants/constants.dart';
import 'package:alatareekeh/services/GetUserInfo.dart';
import 'package:alatareekeh/services/getlogindata.dart';
import 'package:alatareekeh/services/sharedpref.dart';
import 'package:http/http.dart' as http;

class WebServices {
  SharedPref sharedPref = SharedPref();

  //----------------------------------Login-------------------------------------
  //-> Login and post data to server
  Future<GetLoginData> LoginPost(String phone, String password) async {
    var url = Constants.api_link + 'Login_Player';
    final http.Response response = await http
        .post(Uri.parse(url), body: {"phone": phone, "password": password});
    if (response.statusCode == 200) {
      final GetLoginData getlogindata = getLoginDataFromJson(response.body);
      //  print(getlogindata.message);
      return getlogindata;
    } else {
      throw ('error in getting login data player');
    }
  }
  //------------------------------Add Seek Service------------------------------

  Future<String> addSeekService(
      String userId,
      int type,
      String phone,
      String space,
      String date,
      String gender,
      String from,
      String to,
      String username) async {
    var url = Constants.api_link + 'AddOrSeek_Service';

    http.Response response = await http.post(Uri.parse(url), body: {
      "user_id": userId,
      "type": type.toString(),
      "phone": phone,
      "space": space,
      "date": date,
      "gender": gender,
      "from": from,
      "to": to,
      "username": username
    });

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data); // decoding data
      var message = decodedData['message'];
      var userID = decodedData['user_id'];

      return message;
    }
  }

  //---------------------------Get Login Data-----------------------------------
  static Future<GetUserInfo> Get_User_Info(String userId) async {
    var url = Constants.api_link + 'Get_User_Info?user_id=$userId';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;
        final GetUserInfo getUserInfo = getUserInfoFromJson(response.body);

        return getUserInfo;
      }
    } catch (e) {
      print("error in geting data from userinfo service ");
    }
  }

//------------------------------------------------------------------------------
} // end class
