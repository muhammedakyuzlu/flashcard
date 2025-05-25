import 'package:flashcard/product/cache/product_cache.dart';
import 'package:flashcard/product/service/manager/product_service_manager.dart';
import 'package:flashcard/product/state/container/product_state_container.dart';
import 'package:flashcard/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();
}
