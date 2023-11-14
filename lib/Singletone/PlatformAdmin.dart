import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlataformAdmin {

  int getPlataform(){

    if (kIsWeb) {
      return 0;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 1;
      case TargetPlatform.iOS:
        return 2;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }

  }

  String getImage (String urlImagen){

    switch (getPlataform()){
      case 0:
        return "Assets/web/imagenes/" + urlImagen;
      case 1:
        return "Assets/android/imagenes/" + urlImagen;
      case 2:
        return "Assets/ios/imagenes/" + urlImagen;

      default:
        return "Error";
    }

  }

  String getFuente (){

    switch (getPlataform()){
      case 0:
        return 'ComicNeue';
      case 1:
        return 'ComicNeue';
      case 2:
        return 'ComicNeue';

      default:
        return "Error";
    }

  }

}