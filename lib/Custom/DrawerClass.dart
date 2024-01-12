
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Singletone/DataHolder.dart';

class DrawerClass extends StatelessWidget{

  Function(int indice)? onItemTap;

  DrawerClass({Key? key,required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(

              color: Colors.pinkAccent,
            ),
            child: Text(
                style: TextStyle(color: Colors.white),
                'Header'
            ),
          ),
          ListTile(
            leading: Image.asset(DataHolder().plAdmin.getImage("gatete.jpg")),
            selectedColor: Colors.deepOrangeAccent,
            selected: true,
            title: const Text('Cerrar sesion'),
            onTap: () {
              onItemTap!(0);

            },
          ),
          ListTile(
            leading: Icon(Icons.accessible_forward_rounded, color: Colors.red),
            title: const Text('Salir de la aplicacion'),
            onTap: () {
              onItemTap!(1);
            },
          ),
          ListTile(
              leading: const Icon(Icons.search, color: Colors.red),
              title: const Text('Buscar post'),
              onTap: () {
                onItemTap!(2);
                },
          ),
          ListTile(
            leading: Icon(Icons.map_outlined, color: Colors.red),
            title: const Text('Usuarios en 5 km'),
            onTap: () {
              onItemTap!(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.image, color: Colors.red),
                title: const Text ('Gatos api'),
            onTap: (){
              onItemTap!(4);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.red),
            title: const Text ('Chistes api'),
            onTap: (){
              onItemTap!(5);
            },
          ),
        ],
      ),
    );
  }

}