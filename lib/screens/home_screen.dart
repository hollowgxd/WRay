import 'package:flutter/material.dart';
import 'proxy_configurator_screen.dart';

class HomeScreen extends StatefulWidget {
  final ProxyConfig? config;

  const HomeScreen({super.key, required this.config});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    final config = widget.config;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white10.withOpacity(0.05),
                      Colors.pinkAccent.withOpacity(0.06),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    width: 1.3,
                    color: Colors.pinkAccent.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Мониторинг',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _row(Icons.cloud, 'Хост: ${config?.host ?? "—"}'),
                    const SizedBox(height: 14),

                    _row(Icons.speed, 'Скорость: 0 Mb/s'),
                    const SizedBox(height: 14),

                    _row(Icons.wifi_tethering, 'Пинг: 0 ms'),
                    const SizedBox(height: 14),

                    _row(Icons.device_hub, 'Активные подключения: 0'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {
                if (config == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Не выбран профиль")),
                  );
                  return;
                }
                setState(() => connected = !connected);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 95,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: connected
                        ? const [Color(0xFF00FFB7), Color(0xFF008F6B)]
                        : const [Color(0xFF2A2A38), Color(0xFF191922)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        config == null
                            ? 'Профиль не выбран'
                            : connected
                                ? 'Активно'
                                : 'Отключено',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Switch(
                      value: connected,
                      onChanged: (v) {
                        if (config == null) return;
                        setState(() => connected = v);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.pinkAccent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
