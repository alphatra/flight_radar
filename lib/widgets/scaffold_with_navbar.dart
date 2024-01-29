import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ScaffoldWithNavbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  ScaffoldWithNavbar({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Strona Główna'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Zakładki'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
