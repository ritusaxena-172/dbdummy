//shared preferences

import 'package:dbdummy/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> savePreference(String dataemail) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', dataemail);
  return prefs.commit();
}

Future<String> getPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String dataemail = prefs.getString('email');
  return dataemail;
}

void saveData() {
  String dataemail = signinemail;
  savePreference(dataemail);
}
