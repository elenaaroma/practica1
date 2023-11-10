import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      TextButton(onPressed: () => boton1Pressed, child: Icon(Icons.list, color: Colors.red[300],),),
      TextButton(onPressed: () => boton2Pressed, child: Icon(Icons.grid_view, color: Colors.red[300],),),

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

