<<<<<<< HEAD
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:dbdummy/viewModel/checkConnectivity.dart';
import 'package:flutter/material.dart';

void insertingDtaFirebase(BuildContext context, OwnerScreenModel ownerScreenModel) async {
=======
import 'package:dbdummy/database/firebasestore.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:flutter/material.dart';

void insertingDtaFirebase(
    BuildContext context, OwnerScreenModel ownerScreenModel) async {
>>>>>>> 176096e... c_fina
  // upload
  print('Inside insertingDtaFirebase');
  print('uid is still $uid');
  Map<String, String> petInformation = <String, String>{
    "uid": uid,
    "petName": petName.text,
    "petAge": petAge.text,
    "petBreed": petBreed.text,
    "petGender": petGender.text,
    "petDescription": petDescription.text,
    "ImageUrl": ownerScreenModel.imageUrl,
  };
<<<<<<< HEAD
  
  petCollection.document(uid).setData(petInformation).then((_){
    
     print('data set ${petName.text}');
                          petName.clear();
                            petAge.clear();
                            petBreed.clear();
                            petGender.clear();
                            petDescription.clear();
          
       Navigator.pushReplacementNamed(context, Routes().adopterDisplay);                      
=======

  petCollection.document(uid).setData(petInformation).then((_) {
    print('data set ${petName.text}');
    petName.clear();
    petAge.clear();
    petBreed.clear();
    petGender.clear();
    petDescription.clear();

    Navigator.pushReplacementNamed(context, Routes().adopterDisplay);
>>>>>>> 176096e... c_fina
  });
}
