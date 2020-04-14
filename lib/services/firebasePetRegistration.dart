import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';

addAdopter(BuildContext context,PetDisplayModel petDisplayModel) async
  {
    String errorMessage;
  // upload
  print('Inside addAdopter');
  print('uid is still $uid');
  Map<String, String> donorInformation = <String, String>{
    "uid": uid,
    
  };
  donorFav.document(petDisplayModel.petUID).setData(donorInformation).then((_){ //adding uid of adopter to that particular petuid colllection
     print('data set $uid');
                          
  }).catchError((error){  print('error is $error');
    switch (error.code) {
     
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