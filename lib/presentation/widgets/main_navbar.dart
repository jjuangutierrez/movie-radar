import 'package:flutter/material.dart';

class MainNavbar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onDestinationSelected;

  const MainNavbar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.plus_one), label: 'My List'),
      ],
    );
  }
}
