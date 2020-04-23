import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:dbdummy/services/firebasestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

getInformation(dataFirebase) async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  print('here');
  final data =
      await Firestore.instance.collection('users').document(user.uid).get();
  dataFirebase.add(data.data['name']);
  dataFirebase.add(data.data['phone number']);
  return dataFirebase;
=======
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:firebase_auth/firebase_auth.dart';

getInformation(dataFirebase, context) async {
  try {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    print('here');
    final data =
        await Firestore.instance.collection('users').document(user.uid).get();
    dataFirebase.add(data.data['name']);
    dataFirebase.add(data.data['phone number']);
    return dataFirebase;
  } catch (error) {
    catchFirebaseErrors(context, error);
  }
>>>>>>> 176096e... c_fina
}
