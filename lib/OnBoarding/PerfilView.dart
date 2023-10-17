import 'package:app/Custom/KTTextField.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{

  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecEdad = TextEditingController();

  void onClickAceptar(){

    tecNombre.text;
    tecEdad.text;

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