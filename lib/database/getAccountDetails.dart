import 'package:cloud_firestore/cloud_firestore.dart';
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
}
