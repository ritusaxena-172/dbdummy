import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';

getDetails(collectionn) async {
  return await Firestore.instance.collection(collectionn).document(uid).get();
}
