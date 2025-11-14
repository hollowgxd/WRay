import 'package:flutter/material.dart';
import '../widgets/import_widget.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ImportWidget(),
      ),
    );
  }
}
