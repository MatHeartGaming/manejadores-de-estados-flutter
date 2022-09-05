import 'dart:async';

import '../models/usuario.dart';

class _UsuarioService {
  late Usuario _usuario = Usuario(nombre: "", edad: 0, profesiones: []);

  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStreamController =>
      _usuarioStreamController.stream;

  Usuario get getUsuario => _usuario;
  //set setUsuario(Usuario usuario) => _usuario = usuario;

  bool get existeUsuario => (_usuario.nombre.isNotEmpty);

  void cargarUsuario(Usuario newUser) {
    _usuario = newUser;
    _usuarioStreamController.add(newUser);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(_usuario);
  }

  void dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
