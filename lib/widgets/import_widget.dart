import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class ImportWidget extends StatefulWidget {
  const ImportWidget({super.key});

  @override
  State<ImportWidget> createState() => _ImportWidgetState();
}

class _ImportWidgetState extends State<ImportWidget> {
  final controller = TextEditingController();

  void _import() {
    final raw = controller.text.trim();
    if (raw.isEmpty) return;

    Uri? parsed;
    try {
      parsed = Uri.parse(raw);
    } catch (_) {
      parsed = null;
    }

    if (parsed == null || parsed.scheme.isEmpty || parsed.host.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Некорректный URI")),
      );
      return;
    }

    // Навигация: открываем HomeScreen и передаём Uri
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(importedUri: parsed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Оборачиваем в scroll, чтобы клавиатура не ломала layout
    return SingleChildScrollView(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Импорт конфигураций',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Вставьте URI конфигурации',
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: _import,
            icon: const Icon(Icons.download),
            label: const Text("Импортировать"),
          ),
        ],
      ),
    );
  }
}
