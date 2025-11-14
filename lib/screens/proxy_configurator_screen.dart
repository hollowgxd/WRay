import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'import_screen.dart';

class ProxyConfig {
  final Uri uri;
  ProxyConfig(this.uri);

  String get name => uri.userInfo.isNotEmpty ? uri.userInfo : uri.host;
  String get host => uri.host;
}

class ProxyConfiguratorScreen extends StatefulWidget {
  const ProxyConfiguratorScreen({super.key});

  @override
  State<ProxyConfiguratorScreen> createState() => _ProxyConfiguratorScreenState();
}

class _ProxyConfiguratorScreenState extends State<ProxyConfiguratorScreen> {
  int index = 0;

  final List<ProxyConfig> configs = [];
  ProxyConfig? activeConfig;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(config: activeConfig),
      ImportScreen(
        onImport: (uri) {
          setState(() {
            configs.add(ProxyConfig(uri));
            index = 2; // переход на список конфигов
          });
        },
      ),
      _buildConfigList(),
    ];

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
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Профили',
          ),
        ],
      ),
    );
  }

  Widget _buildConfigList() {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: configs.length,
        itemBuilder: (context, i) {
          final config = configs[i];
          final selected = activeConfig == config;

          return GestureDetector(
            onTap: () => setState(() => activeConfig = config),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF15151F),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: selected
                      ? Colors.greenAccent
                      : Colors.pinkAccent.withOpacity(0.4),
                  width: selected ? 2 : 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: selected
                        ? Colors.greenAccent.withOpacity(0.3)
                        : Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Text(
                    "🇷🇺",
                    style: TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          config.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          config.host,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selected)
                    const Icon(Icons.check_circle, color: Colors.greenAccent)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
