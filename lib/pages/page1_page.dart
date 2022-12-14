// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
      ),
      body: InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, "pagina2"),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("General",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ListTile(title: Text("Nombre: "),),
          ListTile(title: Text("Edad: "),),
          ListTile(title: Text("Profesiones",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
          
          Divider(),

          ListTile(title: Text("Profesion 1"),),
          ListTile(title: Text("Profesion 2"),),
          ListTile(title: Text("Profesion 3"),),

        ],
      ),
    );
  }
}
