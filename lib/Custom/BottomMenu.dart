import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Interfaces/BottomMenuEvents.dart';

class BottomMenu extends StatelessWidget{

  BottomMenuEvents events;

 BottomMenu({Key? key, required this.events}
     ) : super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      TextButton(onPressed: () => events.onBottomMenuPressed(0), child: Icon(Icons.list, color: Colors.red[300],),),
      TextButton(onPressed: () => events.onBottomMenuPressed(1), child: Icon(Icons.grid_view, color: Colors.red[300],),),
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

