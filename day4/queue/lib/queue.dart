import 'dart:io';
class Queue
{
  int min,index;
  List<int> number_of_people= List();
  
  void detail()
  {
    int i;
    print('enter no. of queues');
    int number_of_queues=int.parse(stdin.readLineSync());
    print('enter no. of people in each queue');
    for(i=0;i<number_of_queues;i++)
    {
      number_of_people.add(int.parse(stdin.readLineSync()));
    }
    for(i=0;i<number_of_queues;i++)
    {
      min=number_of_people[0];
      if(number_of_people[i]<min)
      {
        index=i;
      }
      else
      {
        index=0;
      }
    }
    index=index+1;
    print('GO to Queue number $index ');
  }
}