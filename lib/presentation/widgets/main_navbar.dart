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
      backgroundColor: Colors.black,
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.gamepad), label: 'Games'),
        NavigationDestination(icon: Icon(Icons.whatshot), label: 'New & Hot'),
        NavigationDestination(icon: Icon(Icons.download), label: 'Downloads'),
      ],
    );
  }
}
