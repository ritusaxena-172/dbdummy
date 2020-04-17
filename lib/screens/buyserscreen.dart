// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dbdummy/components/appbar_decoration.dart';
// import 'package:dbdummy/model/buyer_model.dart';
// import 'package:dbdummy/model/ownerscreen_model.dart';
// import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:dbdummy/services/sqflitehelper_utils.dart';
// import 'package:flutter/material.dart';

// class BuyerScreen extends StatefulWidget {
//   @override
//   BuyerScreenState createState() => BuyerScreenState();
// }

// class BuyerScreenState extends State<BuyerScreen> {
//   QuerySnapshot querySnapshot;
//   DbDog _dbDog = DbDog();
//   getPetInformation() async {
//     print('iniside getpetinfo');
//     return await Firestore.instance.collection('Pet_Details').getDocuments();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: RoundedRectangleBorder(
//           // borderRadius:BorderRadius.circular(80),
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//         ),
//         centerTitle: true,
//         title: Text(
//           'PawSome!',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         flexibleSpace: Container(
//           decoration: boxDecoration,
//         ),
//       ),
//       body: showPetInformation(),
//     );
//   }

//   Widget showPetInformation() {
//     print('inside buyer screen');
//     getPetInformation().then((results) {
//       print('info received');
//       setState(() {
//         querySnapshot = results;
//       });
//     });
//     if (querySnapshot != null) {
//       print('querysnapshot is not null');
//       return ListView.builder(
//           itemCount: querySnapshot.documents.length,
//           itemBuilder: ((BuildContext context, int index) {
//             Dog pets = Dog(
//               name: petname,
//               age: age,
//               breed: breed,
//             );
//             print('pets age is ${pets.age}');
//             _dbDog.insertDog(pets);
//             petname = querySnapshot.documents[index].data['Pet_name'];
//             print(petname);
//             age = querySnapshot.documents[index].data['Pet_age'];
//             breed = querySnapshot.documents[index].data['Pet_breed'];
//             // return Card(
//             //     child: ListTile(
//             //   onTap: () {},
//             // leading:
//             // String image=Image.network(
//             //   imageUrls[index]
//             // );
//             // trailing:

//             // subtitle:

//             // title:

//             return Text('Succesful');

//             // ));
//           }));
//     } else {
//       print('querySnapshot is null');
//       return CircularProgressIndicator();
//     }
//   }
// }
