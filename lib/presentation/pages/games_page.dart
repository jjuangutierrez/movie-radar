import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Radar')),
      body: const Center(
        child: Text('Welcom to games page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
