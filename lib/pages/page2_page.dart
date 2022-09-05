import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 2"),
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
                    final newUser = Usuario(
                        nombre: "matteo",
                        edad: 27,
                        profesiones: [
                          "Desarrollador de app moviles",
                          "Juagodr",
                          "Apasionado de Hardware"
                        ]);
                    usuarioCubit.seleccionarUsuario(newUser); //Llamada a bloc
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
                    usuarioCubit.cambiarEdad(30);
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
                    usuarioCubit.agregarProfesion();
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
