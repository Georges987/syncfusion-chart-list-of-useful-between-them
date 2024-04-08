import 'package:flutter/material.dart';
import 'package:graphe/views/charts/avatarRow.dart';
import 'package:graphe/views/charts/hbarre.dart';
import 'package:graphe/views/charts/part.dart';

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
          ListTile(
            title: const Text('Diagramme circulaire'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Part(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Radial Bar'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RadialBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
