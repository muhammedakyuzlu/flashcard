import 'package:easy_localization/easy_localization.dart';
import 'package:flashcard/product/init/application_initialize.dart';
import 'package:flashcard/product/init/product_localization.dart';
import 'package:flashcard/product/init/state_initialize.dart';
import 'package:flashcard/product/init/theme/custom_dark_theme.dart';
import 'package:flashcard/product/init/theme/custom_light_theme.dart';
import 'package:flashcard/product/navigation/app_router.dart';
import 'package:flashcard/product/state/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

void main() async {
  // Initialize the application [language, orientation, etc.]
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
    );
  }
}
