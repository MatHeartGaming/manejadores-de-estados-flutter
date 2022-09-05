// ignore_for_file: prefer_const_constructors

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            usuarioService.existeUsuario ? usuarioService.usuario.nombre : ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  final usuarioService =
                      Provider.of<UsuarioService>(context, listen: false);
                  final newUser = Usuario(
                      nombre: "Matteo",
                      edad: 27,
                      profesiones: [
                        "Desarrolador de app moviles",
                        "Videojugador",
                        "Hardware enthusiast"
                      ]);
                  usuarioService.usuario = newUser;
                },
                child: Text(
                  "Establecer Usuario",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  final usuarioService =
                      Provider.of<UsuarioService>(context, listen: false);
                  usuarioService.cambiarEdad(28);
                },
                child: Text(
                  "Cambiar Edad",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  usuarioService.agregarProfesion();
                },
                child: Text(
                  "Anadir Profesion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
