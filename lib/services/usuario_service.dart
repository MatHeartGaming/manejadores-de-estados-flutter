import 'dart:math';

import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  late Usuario _usuario = Usuario(nombre: "", edad: 0, profesiones: []);

  get usuario => _usuario;

  set usuario(value) {
    _usuario = value;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = Usuario(nombre: "", edad: 0, profesiones: []);
    notifyListeners();
  }

  bool get existeUsuario => _usuario.nombre.isNotEmpty;

  void agregarProfesion() {
    _usuario.profesiones.add("Profesion ${(_usuario.profesiones.length + 1)}");
    notifyListeners();
  }
}
