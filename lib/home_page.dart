import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int hrs = 8;
  final String name = "Flutter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("TESTING $name FOR $hrs HOURS"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
