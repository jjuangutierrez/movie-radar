import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Radar')),
      body: const Center(
        child: Text('Welcom to downloads page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
