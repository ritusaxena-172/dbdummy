import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/adopterFav.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdopterFav extends StatefulWidget {
  @override
  _AdopterFavState createState() => _AdopterFavState();
}
List<String> favpetUID;
FavModel favmodel= FavModel();
var temp;
class _AdopterFavState extends State<AdopterFav> {

  @override
  void initState()
  {
    print('here ini init state');
     fetchPreferenceUID().then((result){
       favpetUID=result;
       print('favpetttt $favpetUID');
      }
     );
    super.initState();
  }

 

getDetails(index) async{
    print('inside getDetails');
    print('favpetuid is ${favpetUID[index]}');
   
      favmodel.details= await Firestore.instance.collection('PetDetails').document(favpetUID[index]).get();
      print('insisde get details is ${favmodel.details.data['petName']}');
      return favmodel.details;
    }

  
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:petData(),
      //  Container(
      //   color: Colors.red,
      //   width: 300,
      //   height:500,
      //   child: Text('heye'),
        
      //   ),
      
    );
  }
  Widget petData ()
  {
    int length=favpetUID.length;
    print(length);    // return null;
    // getDetails().then((result){
    //   details=result;
    //   print('${details.petName}');
      // qquerysnapshot=result;
      // print('qquery is $qquerysnapshot');
    // });
    return ListView.builder(
      itemCount: favpetUID.length,
      
      itemBuilder: (BuildContext context, index){
        getDetails(index).then((value){
          setState(() {
             temp=value;
          });
        });
        try{
          print('inside list ${temp.data['petName']}');
        return Card(
          child: Text('${temp.data['petName']}'),
        );
        }
        catch(e)
        {
          print(e);
          return e;
        }
      });
    //  Card(
    //   child: Text('${details.petName}'),
    // );

  // if(qquerysnapshot!=null)
  // {
  //   print('not null');
  //   return Container(
  //     child: GridView.builder(
  //       itemCount: qquerysnapshot.documents.length,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           mainAxisSpacing: 20,
  //           crossAxisCount: 1),
  //        itemBuilder: ((BuildContext context,index){
  //         return  Container(

  //           child: Text('${qquerysnapshot.documents[index].data['petName']}'),
  //          );
  //        })
  //        ),
  //   );
  // }
  // else
  // {
  //   print('null');
  //   return Center(child: CircularProgressIndicator());
  // }
  }

}