import 'dart:io';
void main()
{
  print('enter the distance to be covered');
  int n,x;
  double cost,t;
  n = int.parse(stdin.readLineSync());
    if(n<=20)
    {
      x=40;
      print('cost is Rs. 40');
    }
    else
    {
      x=(n-20)*10+40;
      print(x);
    }
    if(n<=20)
    {
      t=n/80;
      cost= t*15+30+15;
      print('cost is Rs. $cost');
    }
    else{
        t=n/80;
      cost=(n-20)*15+30+15+t*15;
      print('cost is Rs. $cost');
    }
  if(cost<=x)
  {
    print('GO for online');
  }
  else
  {
  print('Go for classic');
  }


}