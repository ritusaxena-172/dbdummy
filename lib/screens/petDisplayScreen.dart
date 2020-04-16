// import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/buyer_model.dart';
// import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/model/petDisplayModel.dart';
import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:dbdummy/screens/adopterFavpetsScreen.dart';
import 'package:dbdummy/screens/confirmadoption.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/services/connectivity.dart';
// import 'package:dbdummy/services/firebasePetRegistration.dart';
// import 'package:dbdummy/services/firebasestore.dart';
// import 'package:dbdummy/services/sharedprefs_services.dart';
import 'package:dbdummy/utils/color_services.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class PetDisplay extends StatefulWidget {
  @override
  PetDisplayState createState() => PetDisplayState();
}
bool fav=false;
BuyerModel buyerModel=BuyerModel();

class PetDisplayState extends State<PetDisplay> {
  DocumentReference ref;
  int i;
 PetDisplayModel petDisplayModel= PetDisplayModel(); 
  List<Pet> petList;
  Pet pet;
  
  
  // void initState() {
  //   firebasedatatosqflite();
  //   super.initState();
  // }
  // MediaQueryy mediaQuery= MediaQueryy();
  
  int length;
  
  QuerySnapshot querySnapshot;
  
  getPetInformation() async{
    return await Firestore.instance.collection('PetDetails').getDocuments(); 
  }
  @override
  Widget build(BuildContext context) {
    petDisplayModel.width= MediaQuery.of(context).size.width;
    petDisplayModel.height= MediaQuery.of(context).size.height;  
      return Scaffold(
      backgroundColor: Colors.white,
    //   floatingActionButton: FloatingActionButton(onPressed: 
    // (){print('calling adopter fav');
    // Navigator.pushReplacement(
    //               context,
    //                MaterialPageRoute(
    //                builder: (context) =>
    //                AdopterFav()
    //                ),
    //               );
               
    //            }),
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
    
    // bottomNavigationBar: BottomNavigationBar(
    //   //  currentIndex: 0, // this will be set when a new tab is tapped
    //    items: [
    //      BottomNavigationBarItem(
    //        icon: new Icon(Icons.home),
    //        title: new Text('Home'),
    //      ),
    //      BottomNavigationBarItem(
    //        icon: new Icon(Icons.mail),
    //        title: new Text('Messages'),
    //      ),
    //      BottomNavigationBarItem(
    //        icon: IconButton(
    //          icon: Icon(Icons.favorite, color: Colors.red),
    //          onPressed: (){
    //            Navigator.pushReplacement(
    //               context,
    //                MaterialPageRoute(
    //                builder: (context) =>
    //                AdopterFav()
    //                ),
    //               );
    //          },),
    //        title: Text('favourites'),
    //      )
    //    ]
    // ),




      body: 
      firebaseData(),
    );
  }
   showPetInformation()  
{ 
  checkConnectivity().then((connectivityResult){

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult== ConnectivityResult.wifi) {
      print("Connected");
      return firebaseData();
    } 
     else {
      print("Not connected");
      return Center(child: CircularProgressIndicator());
      // sqfliteData();
    }

  });
    
  }
  Widget firebaseData(){
     getPetInformation().then((results){
       setState(() {
          querySnapshot=results;
       });
      
      // querySnapshot=results;
      //  for(i=0; i<petDisplayModel.length;i++)
      // {
      //   favourites[i]=false; 
      // } 
      });
      if(querySnapshot!=null)
    {
       print('length is ${querySnapshot.documents.length}');
      print('querySnapshot is not null');
     
      return GridView.builder(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisCount: 1),
       itemCount: querySnapshot.documents.length,
       itemBuilder: ((BuildContext context,index){
        print('index is $index');
        // print('name is ${querySnapshot.documents[index].data['petName']}');
        // print('age is ${querySnapshot.documents[index].data['petAge']}');
        // print('age is ${querySnapshot.documents[index].data['petBreed']}');
        // print('URL in buyer is ${buyerModel.imageURL}');
        // return null;
        try {
          // print('inside try');
          return Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: petDisplayModel.width*.8,
              decoration: BoxDecoration(
                border:Border.all(
                  width: 8,
                  color: splashcolor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                 ),
           child: Stack(
           children: <Widget>[
              Image.network(querySnapshot.documents[index].data['ImageUrl'], width: petDisplayModel.width, fit: BoxFit.fill),
              Positioned(
                left:0.0,
                bottom:0.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('  ${querySnapshot.documents[index].data['petName']}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.white)),
                ),
              ),
              Positioned(
                 right:0.0,
                 bottom:0.0,
                 child: Row(
                   children: <Widget>[
                     GestureDetector(
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Text('View Profile',style: TextStyle(
                         fontWeight: FontWeight.bold,
                         // fontSize: 28.0,
                         color: Colors.white)),
                       ),
                       onTap:(){
                         print(uid);
              print('imisde onTap');
              imagEURL=querySnapshot.documents[index].data['ImageUrl'];
              buyerModel.imageURL=querySnapshot.documents[index].data['ImageUrl'];
              buyerModel.petAge=querySnapshot.documents[index].data['petAge'];
              buyerModel.petName =querySnapshot.documents[index].data['petName']; 
              buyerModel.petGender=querySnapshot.documents[index].data['petGender'];
              buyerModel.petBreed=querySnapshot.documents[index].data['petBreed']; 
              buyerModel.petDescription=querySnapshot.documents[index].data['petDescription']; 
              buyerModel.petUID=querySnapshot.documents[index].data['uid']; 
              print(buyerModel.imageURL);
              print(' name is ${buyerModel.petName}');
              Navigator.pushReplacement(
                context,
                 MaterialPageRoute(
                 builder: (context) =>
                 ConfirmAdoption(context, buyerModel)
                 ),
                );
            },
                ),
                     Icon(Icons.arrow_right, color: Colors.white),
                   ],
                 ),
               ),
              // Positioned(
              //   key: ValueKey(index),
              //   right:0,
              //   top:0,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child:
              //       IconButton(
                      

              //         icon: Icon(
              //           buyerModel.favourite? Icons.favorite: Icons.favorite_border, color: Colors.red
              //         ),
              //      onPressed: (){
              //       setState(() {
                      
              //         buyerModel.favourite=!buyerModel.favourite;
              //       });
              //       if(buyerModel.favourite==true)
              //       {
              //          print('uid is$uid');
              //          addAdopter(context,petDisplayModel);//passing that uid to func
              //         print('adding fav data to firebase');   
              //         petDisplayModel.petUID=querySnapshot.documents[index].data['uid']; //uid of that particular dog
              //         savePetUID(petDisplayModel);
                      
              //       }
                      
              //     },
                 
              //      ),
              //   ),
              // ),
          
           ]
            ),
          ),
          ); 
        } 
        catch (e) {
          print(e);
          return e;
        }
       }
       ), 
       );   
     
     }
    else{
       return Center(child: CircularProgressIndicator());
    }
  }
  Widget sqfliteData(){
    return null;
  }
}
   