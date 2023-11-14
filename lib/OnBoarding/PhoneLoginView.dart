
import 'package:app/Custom/KTTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneLoginView extends StatefulWidget{
  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {

  TextEditingController tecPhone = TextEditingController();
  TextEditingController tecVerify = TextEditingController();


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:  Column (
        children: [
          KTTextField(sHint: "Número de telefono", tecController: tecPhone),
          KTTextField(sHint: "Código de verificación",tecController: tecVerify)
        ],
      ),
    );
  }
}