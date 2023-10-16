
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplsahViewState();
  }
}

class _SplsahViewState extends State<SplashView>{

late BuildContext  _context;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSesion();
  }

  void checkSesion() async{
  await Future.delayed(Duration(seconds: 3));
    if(FirebaseAuth.instance.currentUser != null) {
      Navigator.of(_context).popAndPushNamed("/homeview");
    }
    else {
      Navigator.of(_context).popAndPushNamed("/loginview");
    }
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