//shared preferences

import 'package:dbdummy/model/sigin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveData(signInModel) {
  String dataemail = signInModel.signinemail;
  savePreference(dataemail);
}

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
