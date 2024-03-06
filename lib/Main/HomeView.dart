
import 'dart:html';
import 'dart:io';

import 'package:app/Custom/BottomMenu.dart';
import 'package:app/Custom/DrawerClass.dart';
import 'package:app/Custom/PostCellView.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/Custom/PostGridCellView.dart';
import 'package:app/FirestoreObjects/FbPost.dart';
import 'package:app/OnBoarding/LoginView.dart';
import 'package:app/Singletone/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];
  final Map<String,FbPost> mapPosts = Map();
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
    setState(() async{
      if (indice == 0){
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginView()),
            ModalRoute.withName('/logingview'));

      }else if (indice == 1){
        exit(0);
      } else if(indice == 2) {
        TextEditingController _searchController = TextEditingController();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Buscar Post por Título'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese el título a buscar',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String searchValue = _searchController.text.trim();
                      if (searchValue.isNotEmpty) {
                        Navigator.of(context).pop();

                        List<Map<String, dynamic>> searchResults =
                        await DataHolder().fbadmin.getPostByTitle(searchValue);

                        if (searchResults.isNotEmpty) {
                          showDialog(context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text('Resultados de la Búsqueda'),
                                    content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          for (var result in searchResults)
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('título: ${result['titulo']}'),
                                                  Text('cuerpo: ${result['cuerpo']}'),
                                                ])
                                        ]),
                                    actions: [
                                      TextButton(
                                          child: Text('Aceptar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }
                                      )]
                                );
                              }
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text('Resultados de la Búsqueda'),
                                    content: Text('No se encontraron posts con el título proporcionado.'),
                                    actions: [
                                      TextButton(
                                          child: Text('Aceptar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }
                                      )]
                                );
                              }
                          );
                        }
                      }
                    },
                    child: Text('Buscar'),
                  ),
                ],
              ),
            );
          },
        );
      }
      else if (indice == 3){
        Position currentPosition = await DataHolder().geolocAdmin.registrarCambiosLoc();
        GeoPoint currentGeoPoint = GeoPoint(currentPosition.latitude, currentPosition.longitude);
        await DataHolder().geolocAdmin.agregarUbicacionEnFirebase(currentGeoPoint);
        List<String> usersInRange = await DataHolder().geolocAdmin.obtenerUsuariosEnRango();

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Usuarios en rango de 5 km:'),
              content: Column(
                children: usersInRange
                    .map(
                      (userId) => Text(
                    userId ?? 'Usuario sin ID',
                    // 'Usuario sin ID' se mostrará si userId es nulo
                  ),
                )
                    .toList(),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if(indice == 4) {
        String gato = await DataHolder().httpAdmin.getCatData();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Gato'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(gato, height: 300),
                ]),
                actions: [
                  TextButton(
                      child: Text('Cerrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  )]
            );
          }
        );
      } else if(indice == 5) {
        String chiste = await DataHolder().httpAdmin.getDadJoke();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Chiste'),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(chiste)
                  ]),
              actions: [
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descargarPosts();
    loadGeoLocator();
  }

  void loadGeoLocator() async{
    Position pos=await DataHolder().geolocAdmin.determinePosition();
    print("------------>>>> "+pos.toString());
    DataHolder().geolocAdmin.registrarCambiosLoc();

  }

  void descargarPosts() async{
    CollectionReference<FbPost> ref = db.collection("Post").
    withConverter(fromFirestore: FbPost.fromFirestore,
      toFirestore: (FbPost post, _) => post.toFirestore(),);

    ref.snapshots().listen(datosDescargados, onError: descargaPostError,);

  }

  void datosDescargados(QuerySnapshot<FbPost> postsDescargados){
    print("NUMERO DE POSTS ACTUALIZADOS>>>> "+postsDescargados.docChanges.length.toString());

    for(int i=0;i<postsDescargados.docChanges.length;i++){
      FbPost temp = postsDescargados.docChanges[i].doc.data()!;
      mapPosts[postsDescargados.docChanges[i].doc.id]=temp;

    }
    setState(() {
      posts.clear();
      posts.addAll(mapPosts.values);
    });
  }

  void descargaPostError(error){
    print("Listen failed: $error");
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
        actions: [

      ],
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
