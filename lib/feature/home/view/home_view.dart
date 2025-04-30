import 'package:easy_localization/easy_localization.dart';
import 'package:flashcard/product/init/config/app_environment.dart';
import 'package:flashcard/product/init/language/locale_keys.g.dart';
import 'package:flashcard/product/init/product_localization.dart';
import 'package:flashcard/product/utility/constants/enums/locales.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// HomeView is the main view of the application.
class HomeView extends StatefulWidget {
  /// HomeView constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        children: [

          ElevatedButton(onPressed: (){

            if (!kDebugMode) {
                // Code that runs when NOT in debug mode (e.g., release mode)
                print('Running in release mode or non-debug mode');
              } else {
                // Code that runs when in debug mode
                print('Running in debug mode');
              }

          }, child: Text(AppEnvironmentItems.apiKey.value),),
          const Text('Home View'),
          ElevatedButton(
            onPressed: () {
              // language change
              ProductLocalization.updateLanguage(
                context: context,
                value: Locales.en,
              );
            },
            child: const Text(LocaleKeys.general_button_save).tr(),
          ),

          // change theme
          ElevatedButton(
            onPressed: () {
      
            },
            child: const Text(LocaleKeys.general_button_save).tr(),
          ),

          Container(
            height: 200,
            width: 200,
            color: Theme.of(context).colorScheme.primary,
            child: const Center(
              child: Text('Container'),
            ),
          ),
          
        ],
      ),
    );
  }
}
