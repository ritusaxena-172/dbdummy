// import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/database/firebaseToSqfl.dart';
import 'package:dbdummy/model/buyer_model.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:connectivity/connectivity.dart';

// import 'package:dbdummy/screens/confirmadoption.dart';
import 'package:dbdummy/services/firebasestore.dart';
// import 'package:dbdummy/utils/color_services.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class BuyerScreennn extends StatefulWidget {
  @override
  BuyerScreennnState createState() => BuyerScreennnState();
}
class BuyerScreennnState extends State<BuyerScreennn> {
  List<Pet> petList;
  Pet pet;
  void initState() {
    firebasedatatosqflite();
    super.initState();
  }
  MediaQueryy mediaQuery= MediaQueryy();
  BuyerModel buyerModel=BuyerModel();
  int length;
  QuerySnapshot querySnapshot;
  
  getPetInformation() async{
    return await Firestore.instance.collection('users').getDocuments(); 
  }
  @override
  Widget build(BuildContext context) {
    // mediaQuery.width= MediaQuery.of(context).size.width;
    // mediaQuery.height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body:showPetInformation(),
    );
  }
  Widget showPetInformation()  

{ 
  // sqldata();
     getPetInformation().then((results){
       setState(() {
          querySnapshot=results;
        });
      });
      if(querySnapshot!=null)
    {
      length=querySnapshot.documents.length;
      print('length is ${querySnapshot.documents.length}');
      print('querySnapshot is not null');
      return Container(
        child: GridView.builder(
          // padding: EdgeInsets.all(20),
          // scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 1),
         itemCount: querySnapshot.documents.length,
         itemBuilder: ((BuildContext context,index){
          print('index is $index');
          buyerModel.imageURL=querySnapshot.documents[index].data['ImageUrl'];
                // dogUserId=querySnapshot.documents[index].data['UID'];
                // name=querySnapshot.documents[index].data['Pet_name'];
                // age=querySnapshot.documents[index].data['Pet_age'];
                // print('age is $age inside ontap');
                // breed=querySnapshot.documents[index].data['Pet_breed'];
          // buyerModel.imageURL=querySnapshot.documents[index].data['ImageUrl'];
         print('name is ${querySnapshot.documents[index].data['Pet_name']}');
          print('age is ${querySnapshot.documents[index].data['Pet_age']}');
          print('URL in buyer is ${buyerModel.imageURL}');
          return Card (
          child:  Text('Name is  ${querySnapshot.documents[index].data['Pet_name']}'),
          );
          // try {
          //   print('inside try');
          //   return GestureDetector(
          //     child: Card(
          //       elevation: 15.0,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         width: mediaQuery.width*.8,
          //         decoration: BoxDecoration(
          //           border:Border.all(
          //             width: 8,
          //             color: splashcolor,
          //             ),
          //             borderRadius: BorderRadius.circular(12),
          //            ),
          //    child: Stack(
          //      children: <Widget>[
          //         Image.network(querySnapshot.documents[index].data['ImageUrl'], width: mediaQuery.width, fit: BoxFit.fill),
          //         Positioned(
          //           left:0.0,
          //           bottom:0.0,
          //           child: Text('${pet.getName}',style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 28.0,
          //           color: Colors.white)),
          //         ),
          //         Positioned(
          //            right:0.0,
          //            bottom:0.0,
          //            child: Row(
          //              children: <Widget>[
          //                Text('View Profile',style: TextStyle(
          //                fontWeight: FontWeight.bold,
          //                // fontSize: 28.0,
          //                color: Colors.white)),
          //                Icon(Icons.arrow_right),
          //              ],
          //            ),
          //          ),
          //         // Positioned(
          //         //   right:0.0,
          //         //   bottom:0.0,
          //         //   child: Icon(Icons.arrow_right),
          //         // ),
          //         Positioned(
          //           right:0,
          //           top:0,
          //           child: IconButton(
          //             icon: Icon(buyerModel.favourite? Icons.favorite: Icons.favorite_border, color: Colors.red),
          //               onPressed: (){
          //                 buyerModel.favourite=!buyerModel.favourite;
          //               },
          //           ),
          //         ),
          //      ]
          //       ),
          //     ),
          //     ),
          //     onTap:(){
          //       print('tapped');
          //       {
          //       buyerModel.imageURL=querySnapshot.documents[index].data['ImageUrl'];
          //       // dogUserId=querySnapshot.documents[index].data['UID'];
          //       // name=querySnapshot.documents[index].data['Pet_name'];
          //       // age=querySnapshot.documents[index].data['Pet_age'];
          //       // print('age is $age inside ontap');
          //       // breed=querySnapshot.documents[index].data['Pet_breed'];
          //       Navigator.pushReplacement(
          //         context,
          //          MaterialPageRoute(
          //          builder: (context) =>
          //          ConfirmAdoption()
          //          ),
          //         );
          //      }
          //     },
          //   ); 
  
  
            //  GridView.count(
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   crossAxisCount: 2,
            //   children: <Widget>[
            //     Image.network(querySnapshot.documents[index].data['ImageUrl']),
            //   ],
            //  );
            // ListTile(
            // leading: Image.network(querySnapshot.documents[index].data['ImageUrl']),
            //   title: Text('${querySnapshot.documents[index].data['Pet_name']}'),
            //   subtitle: Text('${querySnapshot.documents[index].data['Pet_age']}'),
            //   trailing: Text('${querySnapshot.documents[index].data['Pet_breed']}'),
            //   onTap: (){
            //     imageURL=querySnapshot.documents[index].data['ImageUrl'];
            //     dogUserId=querySnapshot.documents[index].data['UID'];
            //     name=querySnapshot.documents[index].data['Pet_name'];
            //     age=querySnapshot.documents[index].data['Pet_age'];
            //     breed=querySnapshot.documents[index].data['Pet_breed'];
            //     Navigator.pushReplacement(
            //       context,
            //        MaterialPageRoute(
            //        builder: (context) =>
            //        ConfirmAdoption(indexx)
            //        ),
            //       );
            //    } );
          // } 
          // catch (e) {
          //   print(e);
          //   return e;
          // }
         }
         ), 
         ),
      );   
     }
    else{
       return CircularProgressIndicator();
    }
  }
}
   