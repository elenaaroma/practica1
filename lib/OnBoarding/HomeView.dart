
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      shadowColor: Colors.red[300],
      backgroundColor: Colors.deepOrange[100],
    );

  }

}