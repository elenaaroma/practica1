
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;

  void onClickAceptar(){

  }

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registergview");
  }


  @override
  Widget build(BuildContext context) {

    _context = context;

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

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escribe tu contrsaeña'
              ),
              obscureText: true,
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextButton(onPressed: onClickAceptar, child: Text("Aceptar")),
              TextButton(onPressed: onClickRegistrar, child: Text("Registrar")),
            ],

          )

        ],
      ),


    );

  }

}