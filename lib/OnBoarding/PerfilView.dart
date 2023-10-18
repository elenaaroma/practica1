import 'package:app/Custom/KTTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{

  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecEdad = TextEditingController();

  late BuildContext _context;

  FirebaseFirestore db = FirebaseFirestore.instance;

  void onClickAceptar() async{

    final usuario = <String, dynamic>{
      "nombre": tecNombre.text,
      "edad": int.parse(tecEdad.text),
    };

// Add a new document with a generated ID
    String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUsuario).set(usuario);

    Navigator.of(_context).popAndPushNamed("/homeview");
  }

  void onClickCancelar(){

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    this._context = context;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],
      ),
      
      body: Column(
        children: [

          KTTextField(tecController: tecNombre, sHint: "Nombre"),
          KTTextField(tecController: tecEdad, sHint: "Edad"),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextButton(onPressed: onClickAceptar, child: Text("Aceptar")),
              TextButton(onPressed: onClickCancelar, child: Text("Cancelar"))
            ],
          )
        ],
      ),
      );
        
    //);

  }

}