import 'dart:io';

import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';

// import 'package:dbdummy/model/petDisplayModel.dart';

class ShareAPI
{
  onPressed(imagEURL) async{
     var request = await HttpClient().getUrl(Uri.parse(imagEURL));
               var response=  await request.close();
print(response);
Uint8List bytes = await consolidateHttpClientResponseBytes(response);
                    print(bytes);
                    await Share.file('Check out this pet', 'I like it', bytes, 'image/png');
  }

  

  
}