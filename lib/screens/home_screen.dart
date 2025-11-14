import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Uri? importedUri;
  const HomeScreen({super.key, this.importedUri});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    final uri = widget.importedUri;
    final currentHost = uri != null ? uri.host : '—';

    return Scaffold(
      backgroundColor: Colors.black,                    // важно
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // мониторинг
              Expanded(
                flex: 2,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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

                      _infoRow(Icons.cloud, 'Хост: $currentHost'),
                      const SizedBox(height: 14),

                      _infoRow(Icons.speed, 'Скорость: 0 Mb/s'),
                      const SizedBox(height: 14),

                      _infoRow(Icons.wifi_tethering, 'Пинг: 0 ms'),
                      const SizedBox(height: 14),

                      _infoRow(Icons.device_hub, 'Активные подключения: 0'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // нижняя панель подключения
              GestureDetector(
                onTap: () => setState(() => connected = !connected),
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
                    boxShadow: connected
                        ? [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.pinkAccent.withOpacity(0.15),
                              blurRadius: 10,
                            ),
                          ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          connected ? 'Активно' : 'Отключено',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Switch(
                        value: connected,
                        onChanged: (v) => setState(() => connected = v),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // кнопки
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Тест соединения"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Статистика"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.pinkAccent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
