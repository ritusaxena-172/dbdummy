import 'package:dbdummy/screens/accountScreen.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';

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
