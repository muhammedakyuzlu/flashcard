import 'package:easy_localization/easy_localization.dart';
import 'package:flashcard/feature/home/view/home_view.dart';
import 'package:flashcard/product/init/product_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProductLocalization(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner:
          false, // Set to false to hide the debug banner
      title: 'Material App',
      home: const HomeView(),
    );
  }
}
