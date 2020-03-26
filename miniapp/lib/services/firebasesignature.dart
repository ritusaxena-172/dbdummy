import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/firebasemodel.dart';
import 'package:dbdummy/model/signuomodel.dart';
// import 'package:dbdummy/model/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
final userCollection = Firestore.instance.collection('users');
final petCollection= Firestore.instance.collection('Pet_Details');

// final definedCollection=Firestore.instance.collection.
// final databaseReference=Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
//  Future<String> getUID () async{
//   print('inside getUID');
//   final FirebaseUser user = await auth.currentUser();
//   final  uid = user.uid.toString();
//   print(' UID IS ${uid}');
//   return uid;
// }
Future <String>getUID() async {
  print('inside uid');
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid.toString();
    if(uid!=null)
    {
      print('uid is not null $uid');
      return uid;
    }
    else
    {
      print('uid is null!');
      return null;
    }
  }
Future<void> authenticate() async {
  try {
    await auth.createUserWithEmailAndPassword(
        email: signupemail, password: signuppassword);
  } catch (e) {
    print(e.message);
  }
}
// getPetDetails() async {
//   print('inside get details');
//   return await petCollection.getDocuments();
//   }
 