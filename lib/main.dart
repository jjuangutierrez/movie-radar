import 'package:flutter/material.dart';
import 'package:movieradar/presentation/layout/main_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieRadar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainLayout(),
    );
  }
}
