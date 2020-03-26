import 'dart:io';
class fifth
{
  
  List <int> lst = List(6);
  void details()
  {
    int i,j;
    print('enter number');
    
    i= int.parse(stdin.readLineSync());
    print(i);
    for(j=0;j<6;j++)
    {
      lst[j]=i%10;
      i=i~/10;
    }
    
  lst.sort();

  int out=0;

  for(i=5;i>=0;i--)
  {
    out=out*10+lst[i];
  }
  print(out);
}
}
