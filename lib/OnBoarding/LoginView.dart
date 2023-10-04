
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //barra de arriba
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],
      ),


    );

  }

}