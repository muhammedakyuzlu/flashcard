
import 'package:flashcard/feature/home/view/home_view.dart';
import 'package:flashcard/feature/home/view_model/home_view_model.dart';
import 'package:flashcard/product/service/login_service.dart';
import 'package:flashcard/product/service/manager/product_network_error_manager.dart';
import 'package:flashcard/product/state/base/base_state.dart';
import 'package:flashcard/product/state/container/product_state_items.dart';

/// Manage your home view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _homeViewModel = HomeViewModel(
      operationService: LoginService(productNetworkManager),
    );
  }
}
