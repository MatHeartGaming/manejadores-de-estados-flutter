// ignore_for_file: prefer_const_constructors

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStreamController,
        builder: ((context, AsyncSnapshot<Usuario> snapshot) {
          return usuarioService.existeUsuario
              ? InformacionUsuario(
                  usuario: usuarioService.getUsuario // or snapshot.data!,
                )
              : Center(child: Text("No hay informacion del usuario"));
        }),
      ),
      //InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, "pagina2"),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("General",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${usuario.edad}"),
          ),
          ListTile(
            title: Text(
              "Profesiones",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Profesion 1"),
          ),
          ListTile(
            title: Text("Profesion 2"),
          ),
          ListTile(
            title: Text("Profesion 3"),
          ),
        ],
      ),
    );
  }
}
