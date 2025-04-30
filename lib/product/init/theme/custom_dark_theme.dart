import 'package:flashcard/product/init/theme/custom_color_scheme.dart';
import 'package:flashcard/product/init/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.darkColorScheme,
    fontFamily: GoogleFonts.openSans().fontFamily,
    floatingActionButtonTheme: floatingActionButtonThemeData,
  );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
