
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Custom/KTTextField.dart';
import '../FirestoreObjects/FbUsuario.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );

      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentReference<FbUsuario> ref = db.collection("Usuarios").
      doc(uid).
      withConverter(fromFirestore: FbUsuario.fromFirestore,
        toFirestore: (FbUsuario usuario, _) => usuario.toFirestore(),);

      FbUsuario usuario;

      DocumentSnapshot<FbUsuario> docSnap = await ref.get();

      usuario = docSnap.data()!;



     //DocumentSnapshot<Map<String,dynamic>> datos = await db.collection("Usuarios").doc(uid).get();

      if(usuario != null){

        print("El nombre del usuario logueado es: " + usuario.nombre);
        print("La edad del usuario logueado es: " + usuario.edad.toString());

        Navigator.of(_context).popAndPushNamed("/homeview");

      }else{

        Navigator.of(_context).popAndPushNamed("/perfilview");

      }

     // Navigator.of(_context).popAndPushNamed('/homeview');

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

                ),

                Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  child:

                  KTTextField(tecController: passwordController,sHint: 'Escribe tu password', blIsPassword: true ),

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