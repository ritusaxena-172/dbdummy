
import 'dart:io';
import 'dart:math';

class Quiz
{
  String input;
  int i=0;
  List<String> country_name= ['India', 'USA', 'UK', 'Germany', 'China','Russia','Dubai','Sri Lanka' ];
  List<String> capital_name=['Delhi', 'Washington D.C.', 'London','Berlin','Beijing','Moscow','Abu Dabi','colombo'];
  
  void correct()
      {
          print('Congratulations!, Now answer the other question');
          
      }
      void incorrect()
      {
        print('Wrong answer! Try Again');
        input=stdin.readLineSync();
        
      }
      
  void random_country()
  {
while(i==0)
{
      var random_number=Random();
      int x=random_number.nextInt(7);
      print('Enter the capital of the following country, you will get three chances');
      print(country_name[x]);
      input=stdin.readLineSync();
      if(input==capital_name[x])
      {
        correct();
      }
      else
      {
        incorrect();
        if(input==capital_name[x])
        {
          correct();
        }

        else
        {
          incorrect();
          if(input==capital_name[x])
          {
            correct();
          }

          else
          {
            incorrect();
            if(input==capital_name[x])
            {
              correct();
            }
            else
            {
              print('LOSER!');
            }
          

          }
        

        }
      

 
     }     }
      
  }
  
}