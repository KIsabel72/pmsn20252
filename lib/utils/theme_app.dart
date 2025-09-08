import 'package:flutter/material.dart';

class ThemeApp {
  
  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF8B0000),       // Rojo fuego intenso
        onPrimary: Colors.white,          
        secondary: Color(0xFF4B0082),     // Morado oscuro tipo nobleza
        onSecondary: Colors.white,
        error: Color(0xFFB22222),         // Rojo sangre
        onError: Colors.white,
        surface: Color(0xFF1A1A1A),       // Fondo oscuro carbón
        onSurface: Colors.white,            
      ),
    );
    return theme;
  }

  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFFF4500),       // Naranja fuego brillante
        onPrimary: Colors.white,
        secondary: Color(0xFF800080),     // Morado intenso
        onSecondary: Colors.white,
        error: Color(0xFFB22222),         // Rojo sangre
        onError: Colors.white,
        surface: Color(0xFFFFE4E1),       // Fondo suave para widgets
        onSurface: Colors.black,           // Texto sobre surface
      ),
    );
    return theme;
  }


}