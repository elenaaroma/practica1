
import 'dart:html';
import 'dart:io';

import 'package:app/Custom/BottomMenu.dart';
import 'package:app/Custom/DrawerClass.dart';
import 'package:app/Custom/PostCellView.dart';
import 'package:app/Custom/DrawerClass.dart';
import 'package:app/Custom/PostGridCellView.dart';
import 'package:app/FirestoreObjects/FbPost.dart';
import 'package:app/OnBoarding/LoginView.dart';
import 'package:app/Singletone/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void fHomeViewDrawerOnTap(int indice){
    print("->>>>>>>>>>>>" + indice.toString());
    if (indice == 0){
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => LoginView()),
          ModalRoute.withName('/logingview'));
      
    }else if (indice == 1){
      exit(0);
    }
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
        iPosicion: index,
        onItemListClickedFun: onItemListClicked
    );
  }

  Widget? creadorDeItemMatriz (BuildContext context , int index){
    return PostGridCellView(sText: posts[index].titulo,
        dFontSize: 20,
        iColorCode: 0,
        dHeigth : 200,
        iPosicion: index,
        onItemListClickedFun: onItemListClicked
    );
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
        padding: EdgeInsets.all(50),
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
      drawer: DrawerClass(onItemTap: fHomeViewDrawerOnTap,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/postcreateview");
        },
        child: Icon(Icons.add , ),
          backgroundColor: Colors.deepOrange[100],
      ),
    );
  }

  void onItemListClicked(int index){

    DataHolder().selectedPost = posts[index];

    DataHolder().saveSelectedPostInCache();

    Navigator.of(context).pushNamed("/postview");

  }

}
