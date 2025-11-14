import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'import_screen.dart';

class ProxyConfiguratorScreen extends StatefulWidget {
  const ProxyConfiguratorScreen({super.key});

  @override
  State<ProxyConfiguratorScreen> createState() => _ProxyConfiguratorScreenState();
}

class _ProxyConfiguratorScreenState extends State<ProxyConfiguratorScreen> {
  int index = 0;

  final screens = [
    const HomeScreen(),
    const ImportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_export),
            label: 'Импорт',
          ),
        ],
      ),
    );
  }
}
