import 'dart:io';
<<<<<<< HEAD

import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';

// import 'package:dbdummy/model/petDisplayModel.dart';

=======
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
>>>>>>> 176096e... c_fina
class ShareAPI
{
  onPressed(imagEURL) async{
     var request = await HttpClient().getUrl(Uri.parse(imagEURL));
<<<<<<< HEAD
               var response=  await request.close();
print(response);
Uint8List bytes = await consolidateHttpClientResponseBytes(response);
                    print(bytes);
                    await Share.file('Check out this pet', 'I like it', bytes, 'image/png');
  }

  

  
=======
     var response=  await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
        await Share.file('Check out this pet', 'I like it', bytes, 'image/png');
  }
>>>>>>> 176096e... c_fina
}