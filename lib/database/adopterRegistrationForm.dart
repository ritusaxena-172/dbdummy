<<<<<<< HEAD
=======
import 'package:dbdummy/database/firebasestore.dart';
>>>>>>> 176096e... c_fina
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
<<<<<<< HEAD
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
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
    switch (error.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = emailInUse;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_INVALID_EMAIL":
        errorMessage = invalidEmail;
        showAlertDialog(context, errorMessage);
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        errorMessage = networkError;
        showAlertDialog(context, errorMessage);
        break;
      default:
        errorMessage = defaultError;
        showAlertDialog(context, errorMessage);
        
        }
    }
    );
}
=======
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:flutter/material.dart';

void insertDataFirebase(BuildContext context, BuyerForm buyerForm) async {
  String errorMessage;
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
  try{
    acceptorCollection.document(uid).setData(userInformation).then((_) {
    print('data set ${userAge.text}');
    userAge.clear();
    userWork.clear();
    userWorkingHours.clear();
    Navigator.pushReplacementNamed(context, Routes().petDisplay);
  });
  
  }
  catch(e)
  {
     catchFirebaseErrors(context, e);
  }
  
    



}
>>>>>>> 176096e... c_fina
