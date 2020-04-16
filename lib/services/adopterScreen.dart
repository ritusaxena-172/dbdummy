 import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/adopterScreen.dart';
import 'package:flutter/material.dart';

void insertDataFirebase(BuildContext context, BuyerForm buyerForm) async{
  String errorMessage;
  print('inserting data....');
  Map<String, String> userInformation = <String, String>{
      "userAge": buyerForm.userAge,
      "userOccupation": buyerForm.occupation,
      "userFamilyMembers":buyerForm.familyMembers,
      "workType" : buyerForm.wfh,
      "numberOfPets": buyerForm.numberofPets,
      "petInformation": userPetDetails.text,
      "UID": uid,
    };
    acceptorCollection.document(uid).setData(userInformation).then((_){
      print('data set ${userAge.text}');
        userAge.clear();
        userWork.clear();
        userWorkingHours.clear();
        Navigator.pushReplacementNamed(context, Routes().petDisplay);                      
    })..catchError((error){  print('error is $error');
      switchFunction(context,error);
    }
    );
}