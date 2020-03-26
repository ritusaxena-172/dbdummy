import 'dart:io';
void main()
{
  int num, Total,t,i;
  int class1=21,class2=23,class3=56,class4=65,class5=52;
  var list= List(4);
  list=[class1,class2,class3,class4,class5];
  list.sort();
  var newe= list.map((element)=>element).toList();
  Total= class1+class2+class3+class4+class5;
  //print('enter the no. of packetsssss: ');
  //num= int.parse(stdin.readLineSync());
  num=89;
  
  if(num>Total)
  {
      t=Total-1;
      print('Only $t can be sent, SORRY! ');
  }
  else if(num>list[4])
  {
    num=num-list[4];
    list[4]=0;
    if(num>list[3])
    {
      num=num-list[3];
      list[3]=0;

      if(num>list[2])
      {
        num=num-list[2];
        list[2]=0;
        if(num>list[1])
        {
          num=num-list[1];
          list[1]=0;
          list[0]=list[0]-num;
          for(i=0;i<5;i++)
          { 
            stdout.write(newe[i]);
            stdout.write('  ');
            stdout.write(list[i]);
            print('\n');
          }
  
        }
        else
        {
          list[1]=list[1]-num;
          for(i=0;i<5;i++)
           {
            stdout.write(newe[i]);
            stdout.write('  ');
            stdout.write(list[i]);
            print('\n');
            }
  
        }
      }
      else 
      {
        list[2]=list[2]-num;
        for(i=0;i<5;i++)
          {
            stdout.write(list[i]);
            stdout.write(' ');
            stdout.write(newe[i]);
            print('\n');
          }
  
      }
    }
    else {
      list[3]=list[3]-num;
      for(i=0;i<5;i++)
        {
          stdout.write(newe[i]);
          stdout.write('  ');
          stdout.write(list[i]);
          print('\n');
        }
  
    }
  }
  else 
  {
    if(num<list[5])
    {
      list[5]=list[5]-num;
      for(i=0;i<5;i++)
        {
          stdout.write(list[i]);
          stdout.write('  ');
          stdout.write(newe[i]);
          print('\n');
        }
  
    }
  }
  

}