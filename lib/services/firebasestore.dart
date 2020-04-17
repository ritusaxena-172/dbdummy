import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/database/sqflitehelper_utils.dart';
import 'package:dbdummy/model/ownerscreen_model.dart';
import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

OwnerScreenModel ownerScreenModel = OwnerScreenModel();
String petData;
final userCollection = Firestore.instance.collection('users');
final petCollection = Firestore.instance.collection('PetDetails');
final acceptorCollection=Firestore.instance.collection('AcceptorDetails');
final databaseReference = Firestore.instance;
final donorFav = Firestore.instance.collection('donorFav');
FirebaseAuth auth = FirebaseAuth.instance;
DbPet dbPet = DbPet();

//get current user id
Future<String> getUID() async {
  print('inside uid');
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  
  uid = user.uid.toString();
  if (uid != null) {
    print('uid is not null $uid');
    return uid;
  } else {
    print('uid is null!');
    return null;
  }
}

