import 'package:flutter/material.dart';
import 'package:new_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int hrs = 8;
  final String name = "Flutter";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Center(
        child: Container(
          child: Text("TESTING $name FOR $hrs HOURS",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
