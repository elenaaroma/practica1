

import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget{

  String sHint ;

  KTTextField({Key? key,this.sHint = "" }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 
    return Row(
      children: [
        Image.asset("resources/gatete.jpg" , width: 50, height: 50),
        Flexible(
            child:  TextFormField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
                hintText: sHint,
          ),
         )
        )

      ],
    );
    
  }
  
}