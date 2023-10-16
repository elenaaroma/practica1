import 'package:app/Custom/KTTextField.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{

  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecEdad = TextEditingController();

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
          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical:16),
            child:
               KTTextField(tecController: tecNombre, sHint: "Nombre"),
              ),
          KTTextField(tecController: tecEdad, sHint: "Edad")
        ],
      ),
      

      );
        
    //);

  }

}