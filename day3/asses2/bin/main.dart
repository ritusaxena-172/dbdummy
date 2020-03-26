import 'dart:io';
void main()
{
  print("enter the no. of chocolates available in different packets");
  int r,i;
  var list= List(10);
  for(i=0;i<9;i++)
  {
    list[i]=int.parse(stdin.readLineSync());
    
  }
  print(list);
  for(i=0;i<9;i++)
  {
    if(list[i]%31==0)
    {
      r=i;
      break;
    
    }
    

    
  }
print(list[r]);

}