import 'package:estados/bloc/usuario/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  final bloc =
                      BlocProvider.of<UserBloc>(context, listen: false);
                  final newUser = Usuario(
                      nombre: "Matteo",
                      edad: 27,
                      profesiones: ["Desarrollador de app", "Videojugador", "Apasionado de Hardware"]);
                  bloc.add(ActivateUser(newUser));
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
                onPressed: () {},
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
