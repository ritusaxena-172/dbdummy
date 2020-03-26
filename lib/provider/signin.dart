import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/screens/signupsignin/tabcontroller.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signin.dart';
import 'package:dbdummy/services/firebaselogin.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

onPressedLogin(BuildContext context, SignInModel signInModel) async {
  //SignInModel signInModel = SignInModel();
  final formState = ksiginformKey.currentState;
  print(' inside onPressedLogin ${signInModel.signinemail}');
  print(signInModel.signinpassword);
  print('inside onPressedLogin');
  if (formState.validate()) {
    formState.save();
    saveData(signInModel);
    userLogin(context, signInModel);
    // if (flag == 1) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Al;
    //     },
    //   );
    // }
  }
}
