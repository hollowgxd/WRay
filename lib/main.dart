import 'package:flutter/material.dart';
import 'screens/proxy_configurator.dart';

void main() => runApp(const ProxyPrince());

class ProxyPrince extends StatelessWidget {
  const  ProxyPrince({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proxy Configurator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101214),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      ),
      home: const ProxyConfiguratorScreen(),
    );
  }
}
