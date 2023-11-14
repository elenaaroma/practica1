import 'package:app/Main/HomeView.dart';
import 'package:app/Main/PostView.dart';
import 'package:app/OnBoarding/LoginView.dart';
import 'package:app/OnBoarding/PerfilView.dart';
import 'package:app/OnBoarding/PhoneLoginView.dart';
import 'package:app/OnBoarding/RegisterView.dart';
import 'package:app/Splash/SplashView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Main/PostCreateView.dart';

class Actividad1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp;

    if(kIsWeb){
      materialApp = MaterialApp(
        title: "Actividad 1",
        routes: {
          '/loginview': (context)=> LoginView(),
          '/registergview': (context)=> RegisterView(),
          '/homeview': (context)=> HomeView(),
          '/splashview' : (context) => SplashView(),
          '/perfilview' : (context) => PerfilView(),
          '/postview' : (context) => PostView(),
          '/postcreateview' : (context) => PostCreateView(),
        },
        initialRoute: '/loginview',
        debugShowCheckedModeBanner: false,
      );
    }else {
      materialApp = MaterialApp(
        title: "Actividad 1",
        routes: {
          '/loginview': (context)=> PhoneLoginView(),
          '/registergview': (context)=> RegisterView(),
          '/homeview': (context)=> HomeView(),
          '/splashview' : (context) => SplashView(),
          '/perfilview' : (context) => PerfilView(),
          '/postview' : (context) => PostView(),
          '/postcreateview' : (context) => PostCreateView(),
        },
        initialRoute: '/loginview',
        debugShowCheckedModeBanner: false,
      );
    }





    return materialApp;

  }
}
