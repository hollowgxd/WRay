import 'package:flutter/material.dart';
import '../widgets/vless_import_widget.dart';

class ProxyConfiguratorScreen extends StatelessWidget {
  const ProxyConfiguratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proxy Configurator'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: VlessImportWidget(),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.black26,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Добавить сервер'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.tealAccent.shade700,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              // TODO: добавить логику добавления нового сервера
            },
          ),
        ),
      ),
    );
  }
}
