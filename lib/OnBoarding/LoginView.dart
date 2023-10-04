
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

      body: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe tu usuario'
              ),
            ),
          ),

        ],
      ),


    );

  }

}