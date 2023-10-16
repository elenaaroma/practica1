

import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget{

  String sHint ;

  bool blIsPassword;

  TextEditingController tecController = TextEditingController();

  KTTextField({Key? key,this.sHint = "",
    required this.tecController,
    this.blIsPassword = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 
    return Row(
      children: [
        Image.asset("resources/gatete.jpg" , width: 50, height: 50),
        Flexible(
            child:  TextFormField(
              controller: tecController,
              obscureText: blIsPassword,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
                fillColor: Colors.deepOrange[50],
                filled: true,
                labelText: sHint,
                labelStyle: TextStyle(
                  color: Colors.deepOrange[200]
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Colors.red
                  )
                ),
          ),
         )
        )

      ],
    );
    
  }
  
}