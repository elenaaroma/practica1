
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    late BuildContext _context;

    void onClickAceptar(){

    }

    void onClickAtras(){

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Repite tu contrsaeña'
              ),
              obscureText: true,
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextButton(onPressed: onClickAceptar, child: Text("Aceptar")),
              TextButton(onPressed: onClickAtras, child: Text("Atras")),
            ],

          )

        ],
      ),


    );

  }

}