import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painga 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  
                },
                child: Text("Establecer Usuario", style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  
                },
                child: Text("Cambiar Edad", style: TextStyle(color: Colors.white),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  
                },
                child: Text("Anadir Profesion", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
