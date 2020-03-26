import 'dart:io';
class RegistrationForm{
  int age;
  String phone;
  String email;
  String Name;
   void input_details()
   {
    print('enter your phonee');
    phone= stdin.readLineSync();
    print('enter your email');
    email= stdin.readLineSync();
    print('enter your name');
    Name= stdin.readLineSync();
    print('enter your age');
    age= int.parse(stdin.readLineSync());

    print('Your age is: $age');
    print('Your phone no. is:$phone');
    print('Your email is: $email');
    print('Your name is: $Name');

   }

}