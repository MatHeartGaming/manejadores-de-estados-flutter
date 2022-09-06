// ignore_for_file: prefer_const_constructors

import 'package:estados/bloc/usuario/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final bloc = BlocProvider.of<UserBloc>(context, listen: false);
                bloc.add(DeleteUser());
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        title: Text("Painga 1"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user!)
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
  final Usuario user;

  const InformacionUsuario({
    Key? key,
    required this.user,
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
              title: Text("Nombre: ${user.nombre}"),
            ),
            ListTile(
              title: Text("Edad: ${user.edad}"),
            ),
            ListTile(
              title: Text(
                "Profesiones",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            //ListTile(title: Text("Profesion 1"),),
            ...user.profesiones
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
