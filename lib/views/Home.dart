import 'package:flutter/material.dart';
import 'package:graphe/views/hbarre.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste diagramme en batton et code sources'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Diagramme en baton'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
