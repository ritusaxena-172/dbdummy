import 'dart:io';
class Branch{
  String branch_name='ndsnax';
  String branch_id='gahjx';
  String branch_location='sbjhsb';
  void enter()
  {
    int s;
    var l1= ['India', 'Dubai', 'Indonesia'];
    var l2= ['UK', 'USA'];
    print('enter your time in military time zone');
    s=int.parse(stdin.readLineSync());

    if(s>=0800 && s<=1800)
    {
      print('the open universities are: $l1');
    }
    else{
      print('the open universities are: $l2');
    }
  }

}