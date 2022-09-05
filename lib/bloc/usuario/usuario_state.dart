part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;

  @override
  String toString() {
    // TODO: implement toString
    return "Usuario inicial: existe usuario false";
  }

}
