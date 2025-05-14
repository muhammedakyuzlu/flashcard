
import 'package:flashcard/feature/home/view/home_view.dart';
import 'package:flashcard/product/service/manager/product_network_error_manager.dart';
import 'package:flashcard/product/service/manager/product_service_manager.dart';
import 'package:flutter/material.dart';

/// Manage your home view business logic

mixin HomeViewMixin on State<HomeView> {
  late final ProductNetworkManager productNetworkManager;

  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();

    productNetworkManager = ProductNetworkManager.base();

    productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
  }
}
