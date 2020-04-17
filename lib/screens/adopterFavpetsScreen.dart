import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/model/adopterFav.dart';
import 'package:dbdummy/services/sharedprefs_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdopterFav extends StatefulWidget {
  @override
  _AdopterFavState createState() => _AdopterFavState();
}
var detailsss;

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
       print('leength is ${favpetUID.length}');
      }
     );
     
    super.initState();
  }


getDetails(index) async {
  
 
      favmodel.details=null;
      print('favpetuid is ${favpetUID[index]}');
      temp=   await Firestore.instance.collection('PetDetails').document(favpetUID[index]).get();
      return Card(
         child: Text('${temp.data['petName']}'),
        );
    }

 petDetails()
    {
     
      
   return    ListView.builder(
      itemCount: favpetUID.length,
      itemBuilder: (BuildContext context, index)  {
      //   print(index);
         getDetails(index).then((value){
           favmodel.details=value;
            print('inside getdetails fetch $index,  ${favmodel.details.data['petName']}');
       });
      // detailsss=getDetails(index);
       return null;
        //  if(favmodel.details!=null)

        //  {
        //    try{
        //   print('inside list $index,  ${favmodel.details.data['petName']}');
        // return Card(
        //   child: Text('${favmodel.details.data['petName']}'),
        // );

        // }
        // catch(e)
        // {
        //   print(e);
        //   return e;
        // }
       
        //  }
        //  else
        //  {
        //   return  Center(child: CircularProgressIndicator());
        //  }
        //  
      }
      );
 
      }
      
    




// getDetails(index) async
// {
//   var documnt=await Firestore.instance.collection('PetDetails').document(favpetUID[index]);
//   documnt.get()=> then(function(document));
// }

  @override
  Widget build(BuildContext context) {
    print('here');
    return Scaffold(
      body:
       petDetails(),
     
    
      
      //  Container(
      //   color: Colors.red,
      //   width: 300,
      //   height:500,
      //   child: Text('heye'),
        
      //   ),
      
    );
    
  }
 




}

