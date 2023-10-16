

import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget{

  String sHint ;

  bool blIsPassword;

  TextEditingController tecController = TextEditingController();

  double dPaddingH;
  double dPaddingV;



  KTTextField({Key? key,this.sHint = "",
    required this.tecController,
    this.blIsPassword = false
    this.dPaddingH = 60,
    this.dPaddingV = 16,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 
    return
      Padding(padding:  EdgeInsets.symmetric(horizontal: dPaddingH, vertical:dPaddingV),
        child:
      Row(children: [
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
                suffixIcon: Icon(Icons.check_circle),
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
       ),
      );
    
  }
  
}