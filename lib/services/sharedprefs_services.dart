//shared preferences

// import 'package:dbdummy39087830999999szxzx /model/sigin_model.dart';
// import 'package:dbdummy/model/buyer_model.dart';
// import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<String> storeUID=List();

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
void savePetUID(petDisplayModel){
  String petUID= petDisplayModel.petUID;
  print(petUID);
  savePreferenceUID(petUID);
}
savePreferenceUID(String petUID ) async {
  print('inside save prefer');
  print(petUID);
SharedPreferences prefs = await SharedPreferences.getInstance();

await prefs.setStringList("storeUID", storeUID);
print('here');
storeUID.add(petUID);
// storeUID.add('petUID');
print('lenggth is ${storeUID.length}');
print('$storeUID');
// print('0th ${storeUID[0]}');
// print('1st ${storeUID[1]}');
}
fetchPreferenceUID() async {
  print('inside fetch');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
return prefs.getStringList("storeUID");
   
}