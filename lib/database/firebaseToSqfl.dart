import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/services/firebasestore.dart';

firebasedatatosqflite() async {
  int i;
  print('start');
  List<DocumentSnapshot> data =
      (await databaseReference.collection('PetDetails').getDocuments())
          .documents;
  final newData = data
      .map((DocumentSnapshot s) {
        return s.data;
      })
      .toList()
      .cast<Map<String, dynamic>>();
  print('before');
  for (i = 0; i < newData.length; i++) {
    dbPet.insertPet(newData.elementAt(i)).then((_) {
      print('inserted successfully');
    });
  }
  for (i = 0; i < newData.length; i++) {
    Pet(
        petName: newData[i]['petName'],
        uid: newData[i]['uid'],
        petAge: newData[i]['petAge'],
        petBreed: newData[i]['petBreed'],
        petDescription: newData[i]['petDescription']);
  }
  print('done');
}
