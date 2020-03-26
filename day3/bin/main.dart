import 'dart:math';
void main()
{
  var quote= ['all is well', 'be happy','go with the flow', 'you are gonna make it','there you go', 'stay hungry', 'gdsuycaga','vwdjsfghvx','vdjsygahxz','vdtyjxsa'];
 var rng= new Random();
 int r;
 r=rng.nextInt(9)+1;
 print(r);
 print(quote[r-1]);
}