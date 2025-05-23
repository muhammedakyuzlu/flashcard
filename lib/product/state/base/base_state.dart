
import 'package:flashcard/product/state/view_model/product_view_model.dart';
import 'package:flashcard/product/service/manager/product_service_manager.dart';
import 'package:flashcard/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
