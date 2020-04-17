import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/viewModel/firebaseErrors.dart';
import 'package:flutter/material.dart';

void insertDataFirebase(BuildContext context, BuyerForm buyerForm) async {
  print('inserting data....');
  Map<String, String> userInformation = <String, String>{
    "userAge": buyerForm.userAge,
    "userOccupation": buyerForm.occupation,
    "userFamilyMembers": buyerForm.familyMembers,
    "workType": buyerForm.wfh,
    "numberOfPets": buyerForm.numberofPets,
    "petInformation": userPetDetails.text,
    "UID": uid,
  };
  acceptorCollection.document(uid).setData(userInformation).then((_) {
    print('data set ${userAge.text}');
    userAge.clear();
    userWork.clear();
    userWorkingHours.clear();
    Navigator.pushReplacementNamed(context, Routes().petDisplay);
  })
    ..catchError((error) {
      catchFirebaseErrors(context, error);
    });
}
