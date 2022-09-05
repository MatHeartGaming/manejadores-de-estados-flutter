import 'package:estados/pages/page1_page.dart';
import 'package:estados/pages/page2_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Singleton",
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => Page1Page(),
        'pagina2': (_) => Page2Page(),
      },
    );
  }
}
