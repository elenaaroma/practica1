
import 'dart:html';
import 'dart:io';

import 'package:app/Custom/BottomMenu.dart';
import 'package:app/Custom/PostCellView.dart';
import 'package:app/Custom/PostGridCellView.dart';
import 'package:app/FirestoreObjects/FbPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];
  bool bIsList = false;


  void onBottomMenuPressed(int indice) {
    // TODO: implement onBottomMenuPressed
    print("---------> HOME" + indice.toString() + "------> " );
    setState(() {
      if (indice == 1){
        bIsList = false;
      }else if(indice == 0){
        bIsList = true;
      }
      else if(indice == 2){
        exit(0);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargarPosts();
  }

  void descargarPosts() async{
    CollectionReference<FbPost> ref = db.collection("Post").
    withConverter(fromFirestore: FbPost.fromFirestore,
      toFirestore: (FbPost post, _) => post.toFirestore(),);

    QuerySnapshot<FbPost> querySnapshot = await ref.get();

    for(int i = 0 ; i < querySnapshot.docs.length; i++){
      setState(() {
        posts.add(querySnapshot.docs[i].data());
      });
    }
  }

  Widget? creadorDeItemLista (BuildContext context , int index){
    return PostCellView(sText: posts[index].titulo,
        dFontSize: 20,
        iColorCode: 0,
    );
  }

  Widget? creadorDeItemMatriz (BuildContext context , int index){
    return PostGridCellView(sText: posts[index].titulo,
        dFontSize: 20,
        iColorCode: 0,
        dHeigth : 200);
  }

  Widget creadorDeSeparadorLista (BuildContext context , int index){
    return Column(
      children: [
        Divider(),
      ],
    );
  }


  Widget? celdasOLista (bool isList){

    if(bIsList){
      return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      );
    }else{
      return  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: creadorDeItemMatriz
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("HOME"),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],),
      body: Center(
        child: celdasOLista(bIsList)
      ) ,
      bottomNavigationBar: BottomMenu(onBotonesClicked: onBottomMenuPressed),
      drawer: Image.asset("resources/gatete.jpg"),
    );
  }
}
