import 'package:flutter/material.dart';
import 'package:movieradar/presentation/widgets/main_navbar.dart';
import '../pages.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndexPage = 0;

  final List<Widget> pages = const [
    HomePage(),
    GamesPage(),
    NewandhotPage(),
    DownloadsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndexPage],
      bottomNavigationBar: MainNavbar(
        currentIndex: currentIndexPage,
        onDestinationSelected: (index) {
          setState(() {
            currentIndexPage = index;
          });
        },
      ),
    );
  }
}
