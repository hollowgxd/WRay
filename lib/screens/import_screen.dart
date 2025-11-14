import 'package:flutter/material.dart';

class ImportScreen extends StatefulWidget {
  final Function(Uri uri) onImport;

  const ImportScreen({super.key, required this.onImport});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Импорт URI",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "wg://xxxxx@1.2.3.4:443?...",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: const Color(0xFF15151F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    final uri = Uri.parse(controller.text.trim());
                    widget.onImport(uri);
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Некорректный URI")),
                    );
                  }
                },
                child: const Text("Добавить"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
