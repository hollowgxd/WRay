import 'package:flutter/material.dart';

class VlessImportWidget extends StatefulWidget {
  const VlessImportWidget({super.key});

  @override
  State<VlessImportWidget> createState() => _VlessImportWidgetState();
}

class _VlessImportWidgetState extends State<VlessImportWidget> {
  final _controller = TextEditingController();

  void _importConfig() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    // пример парсинга URI
    if (!text.startsWith('vless://')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Некорректный формат URI')),
      );
      return;
    }

    // TODO: Разобрать строку vless://user@host:port?params
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Конфигурация добавлена ✅')),
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
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Импорт конфигураций через URI',
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
          onPressed: _importConfig,
          icon: const Icon(Icons.file_download),
          label: const Text('Импортировать'),
        ),
      ],
    );
  }
}
