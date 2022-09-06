// ignore_for_file: prefer_const_constructors

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/pages/page2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Esto eleva este usuario al context manejado por el Get en toda la app despued que la ejecucion pase por aqui!
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
      ),
      body: Obx(() =>
          usuarioCtrl.existeUsuario.value ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,) : NoInfo()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        //onPressed: () => Navigator.pushNamed(context, "pagina2"),
        onPressed: () => Get.to(() => Page2Page(), popGesture: true),
        /*onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre': 'Matteo',
          'edad': 27,
        }),*/
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No hay informacion del usuario"),
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
            //ListTile(title: Text("Profesion 1"),),
      
            ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion),)),
      
      
          ],
        ),
      ),
    );
  }
}
