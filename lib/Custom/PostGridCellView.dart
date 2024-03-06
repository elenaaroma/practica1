import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Singletone/DataHolder.dart';

class PostGridCellView extends StatelessWidget{

  final String sText;
  final int iColorCode;
  final double dFontSize;
  final double dHeigth;
  final int iPosicion;
  final Function (int indice) onItemListClickedFun;

  const PostGridCellView({super.key,
    required this.sText,
    required this.iColorCode,
    required this.dFontSize,
    required this.dHeigth,
    required this.iPosicion,
    required this.onItemListClickedFun});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        child: FractionallySizedBox(
      child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://previews.123rf.com/images/aprillrain/aprillrain2212/aprillrain221200612/196177803-imagen-de-caricatura-de-un-astronauta-sentado-en-una-luna-ilustraci%C3%B3n-de-alta-calidad.jpg"),
          )
        ),
          color: Colors.amber[iColorCode],
          child: Row(
            children: [
            // Image.asset(DataHolder().plAdmin.getImage("gatete.jpg"),width: 70,height: 70),
              //Text(sText,style: TextStyle(fontSize: dFontSize)),
              Expanded(child: Text(sText, style: TextStyle (fontSize: dFontSize),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 20,
              )),
              TextButton(onPressed: null, child: Text("+",style: TextStyle(fontSize: dFontSize)))
            ],
          )
      ) ,
    ),
        onTap: (){
      onItemListClickedFun(iPosicion);
    },
    );


  }
}