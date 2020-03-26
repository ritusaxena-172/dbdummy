
import 'dart:io';
void main()
{
  String country_name;
  int amount;
  double Amount;
  print('Enter your country name');
  country_name= stdin.readLineSync();
  print('Enter your amount');
  amount=int.parse(stdin.readLineSync());
  if(country_name=='INDIA'|| country_name=='india' )
  {
    print('Amount is Rs. $amount');
  }
  else if(country_name=='USA'|| country_name=='usa')
  {
    Amount= amount*.014;
    print('Amount is USD $Amount');
  }
  else if(country_name=='CHINA'|| country_name=='china')
  {
    Amount= amount*.097;
    print('Amount is $Amount');
  }
  else {
    print('Enter the valid country');
  }
}

