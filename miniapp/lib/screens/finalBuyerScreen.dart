import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_components.dart';
import 'package:dbdummy/model/buyerScreen.dart';
import 'package:dbdummy/model/ownerscreen.dart';
import 'package:dbdummy/screens/confirmationscreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class BuyerScreenn extends StatefulWidget {
  @override
  BuyerScreennState createState() => BuyerScreennState();
}
class BuyerScreennState extends State<BuyerScreenn> {
  QuerySnapshot querySnapshot;
  getPetInformation() async{return await Firestore.instance.collection('Pet_Details').getDocuments(); 
  }
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
      body:showPetInformation(),
    );
  }
  Widget showPetInformation()  
{  getPetInformation().then((results){
     setState(() {
        querySnapshot=results;
      });
    });
    if(querySnapshot!=null)
  {
    return Container(
      // height: 200,
      child: ListView.builder(
      //  itemExtent: 100.0,
       itemCount: querySnapshot.documents.length,
       itemBuilder: ((BuildContext context,index){
        //  age=querySnapshot.documents[index].data['Pet_age'];
        //  print('age is $age');
         imageUrl=querySnapshot.documents[index].data['ImageUrl'];
         print('URL in buyer is $imageUrl');
         print('index is $index');
        try {
          return 
          //  GridView.count(
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   crossAxisCount: 2,
          //   children: <Widget>[
          //     Image.network(querySnapshot.documents[index].data['ImageUrl']),
          //   ],
          //  );
          ListTile(
          leading: Image.network(querySnapshot.documents[index].data['ImageUrl']),
            title: Text('${querySnapshot.documents[index].data['Pet_name']}'),
            subtitle: Text('${querySnapshot.documents[index].data['Pet_age']}'),
            trailing: Text('${querySnapshot.documents[index].data['Pet_breed']}'),
            onTap: (){
              imageURL=querySnapshot.documents[index].data['ImageUrl'];
              dogUserId=querySnapshot.documents[index].data['UID'];
              name=querySnapshot.documents[index].data['Pet_name'];
              age=querySnapshot.documents[index].data['Pet_age'];
              print('age is $age inside ontap');
              breed=querySnapshot.documents[index].data['Pet_breed'];
              Navigator.pushReplacement(
                context,
                 MaterialPageRoute(
                 builder: (context) =>
                 ConfirmAdoption(indexx)
                 ),
                );
             } );
        } 
        catch (e) {
          print(e);
          return e;
        }
       }
       ) 
       ),
    );   
   }
  else{
     return CircularProgressIndicator();
  }
}
}