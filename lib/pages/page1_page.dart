// ignore_for_file: prefer_const_constructors

import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 1"),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, "pagina2"),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);
        /*if (state is UsuarioInitial) {
          return Center(child: Text("No hay informacion del usuario"));
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(
            usuario: state.usuario,
          );
        } else {
          return Center(child: Text("Hubo un error. Estado desconocido."));
        }*/

        switch (state.runtimeType) {
          case UsuarioInitial: return Center(child: Text("No hay informacion del usuario"));
            
          case UsuarioActivo: return InformacionUsuario(usuario: (state as UsuarioActivo).usuario,);

          default: return Center(child: Text("Hubo un error. Estado desconocido."));
        }

      },
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
      
            ...usuario.profesiones
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList()
      
            //ListTile(title: Text("Profesion 1"),),
          ],
        ),
      ),
    );
  }
}
