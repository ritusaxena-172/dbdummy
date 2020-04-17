
String imagEURL;
class PetDisplayModel
{
//  List<bool> _FavouriteList= List();
  
  String _petUID;

  double _width;
  double _height;
  int _length;
set length(int length)
{
  this._length=length;
}
int get length=>_length;

set petUID(String petUID){
  this._petUID=petUID;
}
get petUID=> _petUID;


  //setters n getters

set width(double width)
{
  this._width=width;
}
double get width=>_width;


set height(double height)
{
  this._height=height;
}
double get height=>_height;



}