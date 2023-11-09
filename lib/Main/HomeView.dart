
import 'dart:html';

import 'package:app/Custom/PostCellView.dart';
import 'package:app/Custom/PostGridCellView.dart';
import 'package:app/FirestoreObjects/FbPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<String> posts = <String>['A', 'B', 'C'];
  final List<int> colorCopdes = <int>[600 , 500, 100];

  Widget? creadorDeItemLista (BuildContext context , int index){
    return Text("Post " + posts[index] ,
      style: TextStyle(color: Colors.amber[colorCopdes[index]]));
  }

  Widget creadorDeSeparadorLista (BuildContext context , int index){
    return Divider();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("HOME"),
        centerTitle: true,
        shadowColor: Colors.red[300],
        backgroundColor: Colors.deepOrange[100],),
      body: ListView.separated(
        padding: EdgeInsets.all(80),
        itemCount: posts.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      ),
    );
  }
}

/*

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;

  final List<FbPost> posts = [];
   final bool isList = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargarPosts();
  }

  void descargarPosts() async {

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

  Widget? creadorItemLista(BuildContext context, int index){
    return PostCellView(sText: posts[index].titulo,
      dFontSize: 20,
      iColorCode: 0,
    );
  }

  Widget? creadorItemMatriz(BuildContext context, int index){
    return PostGridCellView(sText: posts[index].titulo,
      dFontSize: 20,
      iColorCode: 0,
    );
  }

  Widget creadorSeparadorLista(BuildContext context, int index) {
    return Column(
      children: [
        Divider(),
      ],
    );
  }

  Widget? celdasOlistas(bool isList){

    if (isList){
      return  ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: posts.length,
        itemBuilder: creadorItemLista,
        separatorBuilder: creadorSeparadorLista,
      );
    } else {
      return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: creadorItemMatriz,
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
        body: celdasOlistas(isList)
    );
  }

}*/