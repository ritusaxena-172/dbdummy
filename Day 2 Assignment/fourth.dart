import 'dart:io';
class Fourth{
  int number;
  void table()
  {
    int i,t;
    print('enter the number');
    number= int.parse(stdin.readLineSync());
    for(i=1;i<=10;i++)
    {
      t=i*number;
      print(t);
    }

  }
}