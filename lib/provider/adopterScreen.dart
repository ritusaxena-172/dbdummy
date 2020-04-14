import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/screens/adopter.dart';
import 'package:dbdummy/services/adopterScreen.dart';
import 'package:flutter/material.dart';

onPressedSave(BuildContext context, BuyerForm buyerForm)
{
  final formState=kFormKey.currentState;
  if(formState.validate())
  {
    formState.save();
     insertDataFirebase(context);
  }
}