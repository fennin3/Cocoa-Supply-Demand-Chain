

import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData{

  static Future<String> getPCID()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String id = pref.getStringList("data")![0];

    return id;
  }
}