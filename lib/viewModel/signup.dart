<<<<<<< HEAD
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasesignup_services.dart';
=======
import 'package:dbdummy/database/firebasesignup_services.dart';
import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
>>>>>>> 176096e... c_fina
import 'package:flutter/cupertino.dart';

onPressedSignup(BuildContext context, SignUpModel signUpModel) {
  final formState = ksigupformKey.currentState;
  if (formState.validate()) {
    formState.save();
    print('inside if statement');
    try {
      userSignup(context, signUpModel);
    } catch (e) {
      print(e.message);
    }
  }
}
