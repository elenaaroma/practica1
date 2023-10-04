import 'package:app/OnBoarding/HomeView.dart';
import 'package:app/OnBoarding/LoginView.dart';
import 'package:app/OnBoarding/RegisterView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Actividad1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        routes: {
          '/logingview': (context)=> LoginView(),
          '/registergview': (context)=> RegisterView(),
          '/homeview': (context)=> HomeView()
        },
      initialRoute: '/logingview',
      debugShowCheckedModeBanner: false,
    );


  }
}
