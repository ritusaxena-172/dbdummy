import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/adopterScreen.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';

String errorMessage;
onPressedSave(BuildContext context, BuyerForm buyerForm) {
  final formState = kFormKey.currentState;
  if (formState.validate()) {
    formState.save();
    insertDataFirebase(context, buyerForm);
  }
}

// onPressedA
onPressAdopter(BuildContext context, BuyerForm buyerForm) {
  if (buyerForm.checkBox2 == true) {
    getUID().then((_) {
      print(uid);
      // saveForm();
      onPressedSave(context, buyerForm);
    });
  } else {
    print('you need to abide by the tnc');
  }
}
