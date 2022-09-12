import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    //print("Arguments: ${Get.arguments}");
    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Painga 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  usuarioCtrl.cargarUsuario(Usuario(
                      nombre: "Matteo",
                      edad: 27,
                      profesiones: [
                        "Desarrollador de app",
                        "Videojuador",
                        "Apasionado de Hardware"
                      ]));

                  //Get.showSnackbar(SnackBar(content: content));
                  Get.snackbar(
                    "Usuario establecido",
                    "${usuarioCtrl.usuario.value.nombre}",
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                      )
                    ],
                  );
                },
                child: const Text(
                  "Establecer Usuario",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  usuarioCtrl.cambiarEdad(28);
                },
                child: const Text(
                  "Cambiar Edad",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  //usuarioCtrl.agregarProfesion("Profesion ${usuarioCtrl.usuario.value.profesiones.length + 1}");
                  usuarioCtrl.agregarProfesion(
                      "Profesion ${usuarioCtrl.profesionesCount + 1}");
                },
                child: const Text(
                  "Anadir Profesion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  print("Theme Change");
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                child: const Text(
                  "Cambiar Tema",
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
