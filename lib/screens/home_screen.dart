import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------- Мониторинг сверху ----------
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

        Row(
          children: const [
            Icon(Icons.speed, color: Colors.pinkAccent, size: 24),
            SizedBox(width: 12),
            Text('Скорость: —', style: TextStyle(fontSize: 20)),
          ],
        ),
        const SizedBox(height: 14),

        Row(
          children: const [
            Icon(Icons.wifi_tethering, color: Colors.pinkAccent, size: 24),
            SizedBox(width: 12),
            Text('Пинг: —', style: TextStyle(fontSize: 20)),
          ],
        ),
        const SizedBox(height: 14),

        Row(
          children: const [
            Icon(Icons.device_hub, color: Colors.pinkAccent, size: 24),
            SizedBox(width: 12),
            Text('Активные подключения: —', style: TextStyle(fontSize: 20)),
          ],
        ),
      ],
    ),
  ),
),


            const Spacer(),

            // ---------- Жирный нижний слайдер ----------
            GestureDetector(
              onTap: () => setState(() => connected = !connected),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 95,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: connected
                        ? [
                            const Color(0xFF00FFB7),     // neon green
                            const Color(0xFF008F6B),
                          ]
                        : [
                            const Color(0xFF2A2A38),
                            const Color(0xFF191922),
                          ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: connected
                      ? [
                          BoxShadow(
                            color: Colors.greenAccent.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ]
                      : [
                          BoxShadow(
                            color: Colors.pinkAccent.withOpacity(0.15),
                            blurRadius: 10,
                          )
                        ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      connected ? 'Активно' : 'Отключено',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
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

            const SizedBox(height: 24),

            // ---------- Две кнопки ----------
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
    );
  }
}
