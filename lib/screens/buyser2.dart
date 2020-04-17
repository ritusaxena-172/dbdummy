import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/database/firebaseToSqfl.dart';
import 'package:dbdummy/model/sqflite_model.dart';
import 'package:dbdummy/services/firebasestore.dart';
import 'package:flutter/material.dart';

Pet pet;

class BuyerScreenn extends StatefulWidget {
  @override
  BuyerScreennState createState() => BuyerScreennState();
}

class BuyerScreennState extends State<BuyerScreenn> {
  List<Pet> petList;
  void initState() {
    firebasedatatosqflite();
    super.initState();
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
      body: FutureBuilder(
          future: dbPet.getPetList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('sjhajhd');
              petList = snapshot.data;
              print(petList.length);
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: petList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Pet pet = petList[index];
                    return Card(
                      child: ListTile(
                        title: Text('Name: ${pet.getName}'),
                        subtitle:
                            Text('Age: ${pet.getAge}\nBreed: ${pet.getBreed} '),
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
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
