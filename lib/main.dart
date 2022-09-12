import 'package:estados/pages/page1_page.dart';
import 'package:estados/pages/page2_page.dart';
import 'package:estados/pages/responsive_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Singleton",
      initialRoute: 'pagina1',
      /*routes: {
        'pagina1': (_) => Page1Page(),
        'pagina2': (_) => Page2Page(),
      },*/
      getPages: [
        GetPage(name: "/pagina1", page: (() => const Page1Page())),
        GetPage(name: "/pagina2", page: (() => const Page2Page())),
        GetPage(name: "/responsive", page: (() => ResponsiveView())),
      ],
    );
  }
}
