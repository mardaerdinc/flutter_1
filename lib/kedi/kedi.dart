import 'package:flutter/material.dart';

class Kedi extends StatelessWidget {
  const Kedi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text("arda")),
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/kedii.png"),
          ),
        ),
      ),
    );
  }
}
