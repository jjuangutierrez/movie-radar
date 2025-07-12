import 'package:flutter/material.dart';

class NewandhotPage extends StatelessWidget {
  const NewandhotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Radar')),
      body: const Center(
        child: Text(
          'Welcom to new and hot pages',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
