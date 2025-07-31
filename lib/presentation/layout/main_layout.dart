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

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [HomePage(), SearchPage(), MyListPage()];

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
