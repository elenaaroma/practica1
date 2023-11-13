import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget{

  Function(int indice) ? onBotonesClicked;

  Function(String nombre)? onPressed = null;

 BottomMenu({Key? key, required this.onBotonesClicked}
     ) : super (key: key);

 void fNombre1(String nombre){
   print("DAM2 " + nombre);
 }

  void fNombre2(String nombre){
    print("DAM2 " + nombre);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    onPressed = fNombre1;
    onPressed!("Elena");
    onPressed = fNombre2;
    onPressed!("Marcos");
    onPressed = fNombre2;
    onPressed!("Hugo");

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: () => onBotonesClicked!(0), child: Icon(Icons.list, color: Colors.red[300],),),
          TextButton(onPressed: () => onBotonesClicked!(1), child: Icon(Icons.grid_view, color: Colors.red[300],),),
          TextButton(onPressed: () => onBotonesClicked!(2), child: Icon(Icons.exit_to_app, color: Colors.red[300],),),

        ]
    );
  }

  void boton1Pressed(){
    botonesClick(0);
  }
  void boton2Pressed(){
    botonesClick(1);
  }

  void botonesClick(int indice){
    print(indice.toString());
  }
  
}

