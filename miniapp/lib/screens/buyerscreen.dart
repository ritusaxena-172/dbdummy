// import 'package:dbdummy/sqqflite.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/model/ownerscreen.dart';
// import 'package:dbdummy/model/buyerScreen.dart';
// import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/screens/confirmationscreen.dart';
import 'package:dbdummy/services/firebasesignature.dart';
import 'package:dbdummy/services/sqflitehelper.dart';
// import 'package:dbdummy/screens/confirmadoption.dart';
// import 'package:dbdummy/screens/confirmationscreen.dart';
// import 'package:dbdummy/services/firebasesignature.dart';
// import 'package:dbdummy/services/sqflitehelper.dart';
// import 'package:dbdummy/services/sqflitehelper_utils.dart';
// import 'package:dbdummy/utils/color_services.dart';
//import 'package:dbdummy/utils/sqflitehelper_utils.dart';
import 'package:flutter/material.dart';

// import 'package:dbdummy/owner.dart';
class BuyerScreen extends StatefulWidget {
  @override
  _BuyerScreenState createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> {
  int length;
  QuerySnapshot querySnapshot;
  // String Pet's name';
  
  // @override
  // void initState() {
  //       super.initState();
  //       getPetDetails().then((results) {
  //         setState(() {
  //           print('inside initstate with petDetails');
  //           querySnapshot = results;
  //           });
  //       });
  //     }
  // getPetDetails() async
  // {
  //    return await userCollection.getDocuments().then((results){
  //           setState(() {
  //             // print('await complete');
  //             querySnapshot = results;
  //           });
  //          });
  // }
  // Dog constructor for calling model
  Dog dog;
  DbDog _dbDoggy = DbDog();
  List<Dog> dogList;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            // borderRadius:BorderRadius.circular(80),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
//         body:   StreamBuilder<QuerySnapshot>(
//             stream: Firestore.instance.collection('Pet_Details').snapshots(),
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 print('snapshot has error');
//                 return Text('error: ${snapshot.error}');
//               }
//               switch(snapshot.connectionState)
//               {
//                 case ConnectionState.waiting:
//                 return Text('Loading');
//                 default:
//                 return ListView(
//                     children: snapshot.data.documents.map((DocumentSnapshot document){
//                        return Card(
//                          child: ListTile(
//                             leading: Text(document['Pet_name']),
//                             title: Text(document['Pet_age']),
//                             subtitle: Text(document['Pet_breed'] ),
//                             trailing:Text(document['Pet_breed'] ),
//                          ),
//                     //Container(child: Text(document['Pet_name'])),
//                     // Container(child: Text(document['Pet_breed'])),
//                   );
//                 }).toList(),
//               );
//                     }
//             }) 
//               );
//               }
// }
              
              // else
              // {
              //   return new ListView(
              //   children: snapshot.data.documents.map((DocumentSnapshot document) {
              //     return new ListTile(
              //       title: new Text(document["Pet's name"]),
              //       subtitle: new Text(document["Pet's name"]),
              //     );
              //   }).toList(),
              // );
              // }

              
          //   },)
          // );



          
    // );
//   }
// }

// StreamBuilder(
//           stream: petCollection.snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
//           {
//             // getPetDetails();
//             if(querySnapshot!=null)
//             {
//               print('snapshot is null');
//               return CircularProgressIndicator();
//             }
//             else{
//               print('snapshot is not null');
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: querySnapshot.documents.length,
                
//                 itemBuilder: (BuildContext context, int index){
//                    return new ListTile(
//                     title: new Text(querySnapshot.documents[index].data["Pet's name"] ),
//                     subtitle: new Text(querySnapshot.documents[index].data["Pet's name"]),
//                   );
//                 },);
//             }
             
//             }
//         ),
     


           
        body: 
        // Container(
        //   child: Image.network(uploadedURL),
        // ),
        // );
   FutureBuilder(
            future: _dbDoggy.getDogList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('sjhajhd');
                dogList = snapshot.data;
                 print(dogList.length);
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dogList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Dog doggy = dogList[index];
                      print(index);
                      print('Name: ${doggy.name}');
                      print('Age: ${doggy.age}\nBreed: ${doggy.breed} ');
                      return Card(
                        child: ListTile(
                          leading: Image.network(imageUrls[index],),
                          title: Text('Name: ${doggy.name}'),
                          subtitle:Text('Age: ${doggy.age}\nBreed: ${doggy.breed} '),
                           onTap: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ConfirmAdoption()),
                            // );
                          },
                      
                        ),
                      );
                      
                    });
              // } );
              }
              else {
                return CircularProgressIndicator();
                     }       
             } ),
    );
  }
}

