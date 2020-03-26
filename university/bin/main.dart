import 'package:university/university.dart';
import 'package:university/branch.dart';
import 'package:university/course.dart';
import 'package:university/students.dart';
void main(List<String>arguments)
{
  var p= University();
  p.printS('AKTU',3,'ECE');
  var q= Students();
  q.Printf('CHHAVI','2016CHA','B.TECH');
  var r= Branch();
  print(r.branch_name);
  print(r.branch_id);
  print(r.branch_location);
  r.enter();
  
  var t= Course();
  print(t.course_id);
  print(t.course_name);
  print(t.price);
  print(t.duration);

}
