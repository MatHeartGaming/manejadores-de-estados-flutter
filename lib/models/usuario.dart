class Usuario {
  String nombre;
  int edad;
  List<String> profesiones;
  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});

  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        edad: edad ?? this.edad, 
        nombre: nombre ?? this.nombre, 
        profesiones: profesiones ?? this.profesiones
    );
}
