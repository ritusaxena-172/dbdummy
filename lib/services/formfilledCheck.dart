import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';

getDetails(collectionn) async {
      print('current uid  is $uid');
      return await Firestore.instance.collection(collectionn).document(uid).get();
      
    }