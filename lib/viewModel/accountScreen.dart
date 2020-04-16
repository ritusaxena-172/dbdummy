// import 'package:dbdummy/screens/accountscreen.dart';
import 'package:dbdummy/screens/accountScreen.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';

onPressedAccountScreen(accountScreenModel) {
  if (kaccountKey.currentState.validate()) {
    kaccountKey.currentState.save();
    try {
      updateData(accountScreenModel);
    } catch (e) {
      print(e.message);
    }
  }
}
