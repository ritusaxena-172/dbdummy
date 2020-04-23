import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:dbdummy/components/appBar_style.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/components/text_style.dart';
import 'package:dbdummy/database/fetchPetDetails.dart';
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/routes/routes.dart';
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/screens/homescreen.dart';
// import 'package:dbdummy/screens/homescreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';

=======
import 'package:dbdummy/components/appbar.dart';
import 'package:dbdummy/database/fetchPetDetails.dart';
import 'package:dbdummy/model/buyer_form.dart';
import 'package:dbdummy/model/general_model.dart';
import 'package:dbdummy/screens/chatScreen.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/viewModel/adopterDisplay.dart';
import 'package:dbdummy/viewModel/firebaseerrors.dart';
import 'package:flutter/material.dart';
>>>>>>> 176096e... c_fina
class AdoptersDisplay extends StatefulWidget {
  AdoptersDisplay(MediaQueryy mediaQuery);
  @override
  _AdoptersDisplayState createState() => _AdoptersDisplayState();
}
BuyerForm buyerForm= BuyerForm();
class _AdoptersDisplayState extends State<AdoptersDisplay> {
<<<<<<< HEAD
=======
  
    
>>>>>>> 176096e... c_fina
 QuerySnapshot querySnapshot;
 DocumentSnapshot query;
 String workStatus, temp, numberofpets, uids;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          centerTitle: true,
          title: Text(
            'PawSome!',
            style: style
          ),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
      ),
    
=======
      appBar: func('Interested Adopters'),
  
>>>>>>> 176096e... c_fina
      body: adopterDisplay(),
    );
  }
 Widget adopterDisplay()
  {
<<<<<<< HEAD
    getPetInformation('AcceptorDetails').then((result){
      setState(() {
         querySnapshot=result;
      });
     
    });
=======
    try{
      getPetInformation('AcceptorDetails').then((result){
      setState(() {
         querySnapshot=result;
      });
    });

    }catch(error)
    {
      catchFirebaseErrors(context, error);
    }
    
>>>>>>> 176096e... c_fina
    if(querySnapshot!=null)
    {
      return GridView.builder(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          crossAxisCount: 2),
         itemCount: querySnapshot.documents.length,
        itemBuilder: (BuildContext context,index)
<<<<<<< HEAD
      
        {
           workStatus= querySnapshot.documents[index].data['workType'];
           if(workStatus=='Yes')
           {
             temp='Works from home';
           }
           else
           {
             temp='Goes to office'; 
           }
           numberofpets=querySnapshot.documents[index].data['numberOfPets'];
           if(numberofpets=='Yes')
           {
             numberofpets='Have other pets too';
           }
           else
           {
             numberofpets='No other pets'; 
           }
          //  
=======
        {
           workStatus= querySnapshot.documents[index].data['workType'];
           temp=checkWorkStatus(workStatus);
           
           numberofpets=querySnapshot.documents[index].data['numberOfPets'];
           numberofpets=checkNumberofPets(numberofpets);
>>>>>>> 176096e... c_fina
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
<<<<<<< HEAD
              
              Expanded(
                              child: Container(
=======
              Expanded(
                  child: Container(
>>>>>>> 176096e... c_fina
                  margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('Age: ${querySnapshot.documents[index].data['userAge']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
              Expanded(
<<<<<<< HEAD
                              child: Container(
=======
                 child: Container(
>>>>>>> 176096e... c_fina
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('${querySnapshot.documents[index].data['userOccupation']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
              Expanded(
<<<<<<< HEAD
                              child: Container(
=======
                    child: Container(
>>>>>>> 176096e... c_fina
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text(temp, style: TextStyle(
                    fontSize: 15,
                    color: firstcolor),),
                ),
              ),
              Expanded(
<<<<<<< HEAD
                              child: Container(
=======
                 child: Container(
>>>>>>> 176096e... c_fina
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text(numberofpets, 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
                ),
              ),
               Expanded(
<<<<<<< HEAD
                                child: Container(
=======
                   child: Container(
>>>>>>> 176096e... c_fina
                   margin:  EdgeInsets.only(left: 12.0,),
                  child: Text('Family Members: ${querySnapshot.documents[index].data['userFamilyMembers']}', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
              ),
               ),
              Expanded(
                       child: GestureDetector(
                     child: Container(
                   margin:  EdgeInsets.only(left: 12.0, ),
                  child: Text('Chat with him', 
                  style: TextStyle(color: firstcolor,fontSize: 15),),
              ),
              onTap: (){
                uids=querySnapshot.documents[index].data['UID'];
<<<<<<< HEAD
                print(uids);

                getDetailsAdopter(uids).then((result){
                  print('here ia m');
=======
                getDetailsAdopter(uids).then((result){
>>>>>>> 176096e... c_fina
                  setState(() {
                    query=result;
                  });
                  if(query!=null)
                  {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                chatWithUid: query.data['uid'], chatWithName:query.data['name']),
                          ));
                  }
                  else
                  {
                    print('query not null');
                  }
                });

              },
                                ),
               ),
            ],
            ),
<<<<<<< HEAD
            // height: mediaQuery.height*.09,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            //  child: ListTile(
               
            //    leading: 
            //    subtitle: Text(temp, style: TextStyle(color: black),),
            //    title: Text('Age: ${querySnapshot.documents[index].data['userAge']}', style: TextStyle(color: secondcolor,fontSize: 20),),
            //    trailing: Text('${querySnapshot.documents[index].data['userOccupation']}', style: TextStyle(color: firstcolor,fontSize: 20),),
            //     onTap: (){
            //       buyerForm.familyMembers=querySnapshot.documents[index].data['userFamilyMembers'];
            //       buyerForm.numberofPets=querySnapshot.documents[index].data['numberOfPets'];
            //       buyerForm.occupation=querySnapshot.documents[index].data['userOccupation'];
            //       buyerForm.userAge=querySnapshot.documents[index].data['userAge'];
            //       buyerForm.wfh=querySnapshot.documents[index].data['workType'];
            //     },
            //  ),
          );
=======
           );
>>>>>>> 176096e... c_fina
        }, 
      );
      }
    
    else
    {
      return Center(child: CircularProgressIndicator());
    }
  }
}