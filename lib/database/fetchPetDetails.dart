import 'package:cloud_firestore/cloud_firestore.dart';

getPetInformation() async{
    return await Firestore.instance.collection('PetDetails').getDocuments(); 
  }