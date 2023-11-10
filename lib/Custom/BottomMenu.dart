import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row( children: [
      TextButton(onPressed: null, child: Text("Lista"),),
      TextButton(onPressed: null, child: Text("Celdas"),),
    ]
    );
  }
  
}

