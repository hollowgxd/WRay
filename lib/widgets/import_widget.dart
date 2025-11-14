import 'package:flutter/material.dart';

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
    } catch (_) {}

    if (parsed == null || parsed.scheme.isEmpty || parsed.host.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Некорректный URI")),
      );
      return;
    }

    // TODO: Сохранить/обработать конфигурацию

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Конфигурация добавлена")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
