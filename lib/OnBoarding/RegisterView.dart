
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget{

    late BuildContext _context;

    TextEditingController usernameController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController respassController=TextEditingController();

    SnackBar snackBar = SnackBar(
      content: Text('Las contraseñas no son iguales '),
    );

    void onClickCancelar(){
      Navigator.of(_context).pushNamed("/loginview");
    }
    void onClickAceptar() async {
      //print("DEBUG>>>> "+usernameController.text);
      if(passwordController.text==respassController.text) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text,
            password: passwordController.text,
          );

          Navigator.of(_context).pushNamed("/loginview");

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('La contraseña es muy debil');
          } else if (e.code == 'email-already-in-use') {
            print('Este email ya esta en uso');
          }
        } catch (e) {
          print(e);
        }
      }
      else{
        ScaffoldMessenger.of(_context).showSnackBar(snackBar);
      }
    }

    @override
    Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],
      ),

      body:

          Padding(padding: EdgeInsets.only(top: 16),
            child:

          Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: TextField (
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escribe tu usuario'
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escribe tu contrsaeña'
                  ),
                  obscureText: true,
                ),
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: TextFormField(
                  controller: respassController,
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
                  TextButton(onPressed: onClickCancelar, child: Text("Cancelar")),
                ],
              )
            ],
          ),

          )

    );

  }

}