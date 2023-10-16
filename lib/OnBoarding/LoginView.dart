
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Custom/KTTextField.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  throwSnackBar(String error){
    SnackBar snackBar = SnackBar(
      content: Text(error),
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registergview");
  }

  void onClickAceptar() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      Navigator.of(_context).popAndPushNamed('/homeview');


    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
        print('Este usuario no es valido');
        throwSnackBar('Este usuario no es valido');
      }
      else if (e.code == 'invalid-login-credentials') {
        print('Esta contraseña y usuario no son correctos');
        throwSnackBar('Esta contraseña y usuario no son correctos');
      }
    }
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

      body:

          Padding ( padding: EdgeInsets.only(top: 16),
            child:
            Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  child:

                  KTTextField(tecController: usernameController,sHint: 'Escribe tu usuario' ),

                 /* TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escribe tu usuario'
                    ),
                  ),*/
                ),

                Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  child:

                  KTTextField(tecController: passwordController,sHint: 'Escribe tu password', blIsPassword: true ),

                  /*TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escribe tu contrsaeña'
                    ),
                    obscureText: true,
                  ),*/
                ),




                Row(mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    TextButton(onPressed: onClickAceptar, child: Text("Aceptar")),
                    TextButton(onPressed: onClickRegistrar, child: Text("Registrar")),
                  ],

                )
              ],
            ),
          ),




    );

  }

}