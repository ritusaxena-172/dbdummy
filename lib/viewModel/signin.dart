<<<<<<< HEAD
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signin.dart';
import 'package:dbdummy/services/firebaselogin.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';

=======
import 'package:dbdummy/database/firebaselogin.dart';
import 'package:dbdummy/database/sharedpreference.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signin.dart';
>>>>>>> 176096e... c_fina
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

onPressedLogin(BuildContext context, SignInModel signInModel) async {
  final formState = ksiginformKey.currentState;
<<<<<<< HEAD
  print(' inside onPressedLogin ${signInModel.signinemail}');
  print(signInModel.signinpassword);
  print('inside onPressedLogin');
=======
>>>>>>> 176096e... c_fina
  if (formState.validate()) {
    formState.save();
    saveData(signInModel);
    userLogin(context, signInModel);
<<<<<<< HEAD
    // if (flag == 1) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Al;
    //     },
    //   );
    // }
  }
=======
   }
>>>>>>> 176096e... c_fina
}
