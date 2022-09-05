import 'package:estados/pages/page1_page.dart';
import 'package:estados/pages/page2_page.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UsuarioService()), /* lazy: true // Put to false for faster performance */),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Singleton",
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Page1Page(),
          'pagina2': (_) => Page2Page(),
        },
      ),
    );
  }
}
