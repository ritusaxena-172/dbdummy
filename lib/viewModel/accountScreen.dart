<<<<<<< HEAD
import 'package:dbdummy/screens/accountScreen.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';
=======
import 'package:dbdummy/database/firebasesignup_services.dart';
import 'package:dbdummy/screens/accountScreen.dart';
>>>>>>> 176096e... c_fina

onPressedAccountScreen(accountScreenModel, context) {
  if (kaccountKey.currentState.validate()) {
    kaccountKey.currentState.save();
    try {
      updateData(accountScreenModel, context);
    } catch (e) {
      print(e.message);
    }
  }
}
