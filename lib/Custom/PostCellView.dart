
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget{

  final String sText;
  final int iColorCode;
  final double dFontSize;
  final int iPosicion;
  final Function (int indice) onItemListClickedFun;

  const PostCellView({super.key,
    required this.sText,
    required this.iColorCode,
    required this.dFontSize,
    required this.iPosicion,
    required this.onItemListClickedFun
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return InkWell(
     child: Container(
       color: Colors.amber[iColorCode],
       child: Row(
           children:[
             Image.asset("resources/gatete.jpg", width: 30,height: 30),
             Text(sText)
           ]
       ),
     ),
     onTap: (){
       onItemListClickedFun(iPosicion);
     },
   )
   ;

     Text(sText ,
         style: TextStyle(color: Colors.amber[iColorCode]));
  }

}