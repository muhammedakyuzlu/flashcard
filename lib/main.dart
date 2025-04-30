import 'package:easy_localization/easy_localization.dart';
import 'package:flashcard/feature/home/view/home_view.dart';
import 'package:flashcard/product/init/application_initialize.dart';
import 'package:flashcard/product/init/product_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  // Initialize the application [language, orientation, etc.]
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomeView(),
    );
  }
}
