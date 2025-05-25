import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flashcard/product/cache/product_cache.dart';
import 'package:flashcard/product/init/config/app_environment.dart';
import 'package:flashcard/product/state/container/product_state_container.dart';
import 'package:flashcard/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable
/// This class is used to initialize the application
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    // Localization initialize
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    // Localization initialize
    await EasyLocalization.ensureInitialized();

    // only show the error messages from the localization
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    // the mobile app is only supported in portrait mode
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // TODO: move to Splash
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// TODO: add custom logger
      Logger().e(details.exceptionAsString());
    };

    // Initialize environment and container
    _productEnvironmentWithContainer();

    // Ensure container is initialized before accessing ProductCache
    if (!GetIt.I.isRegistered<ProductCache>()) {
      throw Exception(
        'ProductCache is not registered. Container initialization failed.',
      );
    }

    // Initialize cache after container setup
    await ProductStateItems.productCache.init();
  }

  /// DO NOT CHANGE THIS METHOD
  void _productEnvironmentWithContainer() {
    AppEnvironment.general();
    ProductContainer.setup();
  }
}
