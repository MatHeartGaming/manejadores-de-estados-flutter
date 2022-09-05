// ignore_for_file: prefer_const_constructors

import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
        actions: [
          IconButton(
            tooltip: "Borrar datos del usuario",
            onPressed: (() {
              usuarioService.removerUsuario();
            }),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario,
            )
          : Center(child: Text("No hay informacion")),
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
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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

            ...usuario.profesiones.map
                  ((profesion) => ListTile(title: Text(profesion),))
                  .toList(),
            
      
            //ListTile(title: Text("Profesion 1"),),
      
          ],
        ),
      ),
    );
  }
}
