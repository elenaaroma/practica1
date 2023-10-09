
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget{

late BuildContext  _context;


  void checkSesion() async{

  await Future.delayed(Duration(seconds: 5));
  Navigator.of(_context).popAndPushNamed("/loginview");
  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _context = context;
    checkSesion();


    Column column = Column(
      children: [
        Image.asset("resources/gatete.jpg", width: 400,height: 600),
        CircularProgressIndicator()
      ],
    );

    return column;

  }

}