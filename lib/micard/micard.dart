import 'package:flutter/material.dart';

class Micard extends StatelessWidget {
  const Micard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              color: Colors.white,
              child: Text("cont1"),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              color: Colors.red,
              child: Text("cont.2"),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              color: Colors.yellow,
              child: Text("cont.3"),
            ),
          ],
        )),
      ),
    );
  }
}
