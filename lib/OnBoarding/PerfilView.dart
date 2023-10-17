import 'package:app/Custom/KTTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{

  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecEdad = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void onClickAceptar(){

    final usuario = <String, dynamic>{
      "nombre": tecNombre.text,
      "edad": int.parse(tecEdad.text),
    };

// Add a new document with a generated ID
    db.collection("Usuarios").add(usuario);
  }

  void onClickCancelar(){

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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