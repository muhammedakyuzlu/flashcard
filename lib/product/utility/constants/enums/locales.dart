import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  // if you want to add a new locale, please add it here

  /// English locale
  en(Locale('en', 'US'));

  const Locales(this.locale);

  /// Locale value
  final Locale locale;

}
