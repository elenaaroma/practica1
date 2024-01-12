
import 'package:app/Singletone/FirebaseAdmin.dart';
import 'package:app/Singletone/GeolocAdmin.dart';
import 'package:app/Singletone/PlatformAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FirestoreObjects/FbPost.dart';
import 'HttpAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAdmin fbadmin = FirebaseAdmin();
  PlataformAdmin plAdmin = PlataformAdmin();
  GeolocAdmin geolocAdmin = GeolocAdmin();
  HttpAdmin httpAdmin = HttpAdmin();



  String sNombre ="Kyty";
  late String sPostTitle;
  late FbPost selectedPost;

  DataHolder._internal(){

  }

  void initDataHolder(){

    sPostTitle = "Titulo de Post";

  }

  factory DataHolder(){
    return _dataHolder;
  }

  void insertPostEnFB(FbPost postNuevo){

    CollectionReference<FbPost> postsRef = db.collection("Post").withConverter(
        fromFirestore: FbPost.fromFirestore,
        toFirestore: (FbPost post, _) => post.toFirestore());

    postsRef.add(postNuevo);

  }

  void saveSelectedPostInCache() async{
    if(selectedPost!=null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('fbpost_titulo', selectedPost!.titulo);
      prefs.setString('fbpost_cuerpo', selectedPost!.cuerpo);
      prefs.setString('fbpost_sUrlImg', selectedPost!.sUrlImg);
    }

  }

  Future<FbPost> loadFbPost() async{

    if (selectedPost != null )return selectedPost;

    await Future.delayed(Duration(seconds: 10));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? fbpost_titulo = prefs.getString('fbpost_titulo');
    fbpost_titulo ??= '';

    String? fbpost_cuerpo = prefs.getString('fbpost_cuerpo');
    fbpost_cuerpo ??= '';

    String? fbpost_sUrlImg = prefs.getString('fbpost_sUrlImg');
    fbpost_sUrlImg ??= '';

    print("->>>>>>>>>>>>><<" + fbpost_titulo);

    selectedPost = FbPost(titulo: fbpost_titulo , cuerpo: fbpost_cuerpo, sUrlImg: fbpost_sUrlImg);
    return selectedPost;
  }

}