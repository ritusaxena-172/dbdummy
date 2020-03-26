import 'dart:io';
class third
{
  String address;
  void details()
  {
    int i;
    print('enter your address');
    address= stdin.readLineSync();
    print(address.toUpperCase());
    
  }
   
}