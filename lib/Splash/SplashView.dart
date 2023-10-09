
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{

late BuildContext  _context;


  void checkSesion () async{



  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _context = context;

    Column column = Column(
      children: [
        Image.asset("resources/gatete.jpg", width: 400,height: 600),
        CircularProgressIndicator()
      ],
    );

    return column;

  }

}