
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Custom/KTTextField.dart';
import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class PostCreateView extends StatefulWidget{

  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {
  TextEditingController tecTitulo=TextEditingController();

  TextEditingController tecCuerpo=TextEditingController();

  ImagePicker _picker=ImagePicker();

  File _imagePreview=File("");

  void onGalleryClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState(() {
        _imagePreview=File(image.path);
      });
    }
  }

  void onCameraClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      setState(() {
        _imagePreview=File(image.path);
      });
    }
  }

  void subirPost() async {
    final storageRef = FirebaseStorage.instance.ref();

    String rutaEnNube= "posts/"+FirebaseAuth.instance.currentUser!.uid+"/imgs/"+ DateTime.now().millisecondsSinceEpoch.toString()+".jpg";

    final rutaAFicheroEnNube = storageRef.child(rutaEnNube);
    // Create the file metadata
    final metadata = SettableMetadata(contentType: "image/jpeg");
    try {
      await rutaAFicheroEnNube.putFile(_imagePreview,metadata);

    } on FirebaseException catch (e) {
      print("ERROR AL SUBIR IMAGEN: "+e.toString());
    }

    String imgUrl=await rutaAFicheroEnNube.getDownloadURL();

    FbPost postNuevo=new FbPost(
        titulo: tecTitulo.text,
        cuerpo: tecCuerpo.text,
        sUrlImg: imgUrl);
    DataHolder().insertPostEnFB(postNuevo);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar( title: Text(DataHolder().sNombre),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],
      ),
      body: Column(
        children: [

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: KTTextField(tecController: tecTitulo,
                sHint: 'Escribe un titulo' ),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: KTTextField(tecController: tecCuerpo,
                sHint: 'Escribe un cuerpo' ),
          ),
          Image.file(_imagePreview, width: 400, height: 400, scale: 1.0),
          Row (
            children: [
              TextButton(onPressed: onGalleryClicked, child: Text("Galeria")),
              TextButton(onPressed: onCameraClicked, child: Text("Camara")),

            ],
          ),
          TextButton(onPressed: (){

            FbPost postNuevo = new FbPost(titulo: tecTitulo.text,
                cuerpo: tecCuerpo.text,
                sUrlImg: "");

            DataHolder().insertPostEnFB(postNuevo);

          }, child: Text("Postear"))

        ],
      ),
    );

  }
}

/*

import 'dart:html';

import 'package:app/FirestoreObjects/FbPost.dart';
import 'package:app/Singletone/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Custom/KTTextField.dart';

class PostCreateView extends StatelessWidget {

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController tecTitulo=TextEditingController();
  TextEditingController tecCuerpo=TextEditingController();

  ImagePicker _picker=ImagePicker();

  File _imagePreview=File("");

  void onGalleryClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);


  }

  void onCameraClicked() async{
    XFile? image = await _picker.pickImage(source: ImageSource.camera);


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar( title: Text(DataHolder().sNombre),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],
      ),
      body: Column(
        children: [
          
          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: KTTextField(tecController: tecTitulo,
                sHint: 'Escribe un titulo' ),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: KTTextField(tecController: tecCuerpo,
                sHint: 'Escribe un cuerpo' ),
          ),
          Image.file(_imagePreview, width: 400, height: 400, scale: 1.0),
          Row (
            children: [
              TextButton(onPressed: onGalleryClicked, child: Text("Galeria")),
              TextButton(onPressed: onCameraClicked, child: Text("Camara")),

            ],
          ),
          TextButton(onPressed: (){

            FbPost postNuevo = new FbPost(titulo: tecTitulo.text,
                cuerpo: tecCuerpo.text,
                sUrlImg: "");

              DataHolder().insertPostEnFB(postNuevo);

           }, child: Text("Postear"))

        ],
      ),
    );

  }

}

*/