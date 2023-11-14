import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Custom/KTTextField.dart';

class PhoneLoginView extends StatefulWidget{
  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {

  TextEditingController tecPhone=TextEditingController();
  TextEditingController tecVerify=TextEditingController();
  String sVerificationCode="";
  bool blMostrarVerificacion=false;

  void enviarTelefonoPressed() async{
    String sTelefono=tecPhone.text;

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: sTelefono,
        verificationCompleted: verificacionCompletada,
        verificationFailed: verificacionFallida,
        codeSent: codigoEnviado,
        codeAutoRetrievalTimeout: tiempoDeEsperaAcabado);
  }

  void enviarVerifyPressed() async{
    String smsCode = tecVerify.text;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: sVerificationCode, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.of(context).popAndPushNamed("/homeview");
  }

  void verificacionCompletada(PhoneAuthCredential credencial) async{
    await FirebaseAuth.instance.signInWithCredential(credencial);

    Navigator.of(context).popAndPushNamed("/homeview");
  }

  void verificacionFallida(FirebaseAuthException excepcion){
    if (excepcion.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void codigoEnviado(String codigo, int? resendToken) async{
    sVerificationCode=codigo;
    setState(() {
      blMostrarVerificacion=true;
    });

  }

  void tiempoDeEsperaAcabado(String verID){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          KTTextField(sHint: "Numero Telefono",tecController: tecPhone),
          TextButton(onPressed: enviarTelefonoPressed, child: Text("Enviar")),
          if(blMostrarVerificacion)
            KTTextField(sHint: "Numero Verificacion",tecController: tecVerify),
          if(blMostrarVerificacion)
            TextButton(onPressed: enviarVerifyPressed, child: Text("Enviar"))
        ],

      ),

    );
  }
}



/*
class PhoneLoginView extends StatefulWidget{
  @override
  State<PhoneLoginView> createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {

  TextEditingController tecPhone = TextEditingController();
  TextEditingController tecVerify = TextEditingController();

  void enviarTelefonoPressed() async{

    String sTelefono = tecPhone.text;
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: verificacionCompletada,
        verificationFailed: verificacionFallida,
        codeSent: codigoEnviado,
        codeAutoRetrievalTimeout: tiempoDeEsperaAcabado);

  }

  void enviarCodigoPressed() async{

    String smsCode = tecVerify.text;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: sVerificationCode, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);

  }

  void verificacionCompletada (PhoneAuthCredential credential)async{

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).popAndPushNamed("/homeview");

  }

  void verificacionFallida (FirebaseAuthException ex){
    if (ex.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
  }

    void codigoEnviado(String codigo, int? resendToken) async{
      sVerificationCode=codigo;
      setState(() {
        blMostrarVerificacion=true;
      });
  void tiempoDeEsperaAcabado (String verID){

  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:  Column (
        children: [
          KTTextField(sHint: "Número de telefono", tecController: tecPhone),
          TextButton(onPressed: enviarTelefonoPressed , child: Text("Enviar")),
          KTTextField(sHint: "Código de verificación",tecController: tecVerify),
          TextButton(onPressed: enviarCodigoPressed , child: Text("Enviar")),

        ],
      ),
    );
  }
}
    */