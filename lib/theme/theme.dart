import 'package:flutter/material.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0A0A0F), // глубокий тёмный фон

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFB100E8),      // ultraviolet
    secondary: Color(0xFFFF4FD8),    // sakura pink neon
    surface: Color(0xFF12121A),
    onPrimary: Colors.white,
  ),

  // Кнопки
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFB100E8),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  ),

  // Текст
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Карточки/контейнеры
  cardColor: const Color(0xFF15151F),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(Colors.white),
    trackColor: WidgetStatePropertyAll(Color(0xFF3D003F)), // ультрафиолетовый след
  ),
);
