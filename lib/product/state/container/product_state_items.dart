
import 'package:flashcard/product/service/manager/product_service_manager.dart';
import 'package:flashcard/product/state/container/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
}
