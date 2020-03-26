class BuyerModel {
  String petname;
  String age;
  String breed;
  String _imageURL;
  bool _favourite;

   set imageURL(String imageURL)
   {
     this._imageURL=imageURL;
   }
   String get imageURL=>_imageURL;



  set favourite(bool favourite)
  {
    this._favourite=favourite;
  }
  get favourite=> _favourite;



}
