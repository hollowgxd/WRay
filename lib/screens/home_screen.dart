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
            // ---------- Мониторинг СВЕРХУ ----------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Мониторинг',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 12),
                  Text('• Скорость: —'),
                  Text('• Пинг: —'),
                  Text('• Активные подключения: —'),
                ],
              ),
            ),

            const Spacer(),

            // ---------- ЖИРНЫЙ нижний слайдер ----------
            GestureDetector(
              onTap: () => setState(() => connected = !connected),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 95,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: connected
                      ? Colors.greenAccent.shade700
                      : Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(18),
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
                      onChanged: (v) =>
                          setState(() => connected = v),
                      activeColor: Colors.white,
                      thumbColor: WidgetStateProperty.all(Colors.white),
                      trackColor: WidgetStateProperty.all(Colors.black26),
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
