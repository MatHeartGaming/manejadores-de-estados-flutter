// ignore_for_file: prefer_const_constructors

import 'package:estados/bloc/usuario/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario()
              : Center(
                  child: Text("No hay informacion del usuario"),
                );
        },
      ),
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
            title: Text("Nombre: "),
          ),
          ListTile(
            title: Text("Edad: "),
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
