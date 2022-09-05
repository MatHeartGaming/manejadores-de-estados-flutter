import 'package:estados/models/usuario.dart';
import 'package:estados/pages/page1_page.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: usuarioService.getUsuario,
          stream: usuarioService.usuarioStreamController,
          builder: ((context, AsyncSnapshot<Usuario> snapshot) {
            return Text(snapshot.hasData && usuarioService.existeUsuario ? usuarioService.getUsuario.nombre : "");
          }),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  final newUser = Usuario(
                      nombre: "Matteo",
                      edad: 27,
                      profesiones: ["Desarrolador de Aplicaciones"]);
                  usuarioService.cargarUsuario(newUser);
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
                onPressed: () {},
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
