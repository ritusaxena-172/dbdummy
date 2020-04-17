import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/firebaseErrors.dart';
import 'package:flutter/material.dart';

addAdopter(BuildContext context, PetDisplayModel petDisplayModel) async {
  // upload
  print('Inside addAdopter');
  print('uid is still $uid');
  Map<String, String> donorInformation = <String, String>{
    "uid": uid,
  };
  donorFav.document(petDisplayModel.petUID).setData(donorInformation).then((_) {
    //adding uid of adopter to that particular petuid colllection
    print('data set $uid');
  }).catchError((error) {
    catchFirebaseErrors(context, error);
  });
}
