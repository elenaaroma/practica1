import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget{

  final String sText;
  final int iColorCode;
  final double dFontSize;
  final double dHeigth;

  const PostGridCellView({super.key,
    required this.sText,
    required this.iColorCode,
    required this.dFontSize,
    required this.dHeigth});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

    FractionallySizedBox(
      child:Container(
          color: Colors.amber[iColorCode],
          child: Row(
            children: [
              Image.asset("resources/gatete.jpg",width: 70,
                  height: 70),
              Text(sText,style: TextStyle(fontSize: dFontSize)),
              TextButton(onPressed: null, child: Text("+",style: TextStyle(fontSize: dFontSize)))
            ],
          )
      ) ,
    );


  }
}