import 'package:flashcard/feature/home/view_model/home_state.dart';
import 'package:flashcard/product/cache/model/user_cache_model.dart';
import 'package:flashcard/product/service/interface/authenction_operation.dart';
import 'package:flashcard/product/state/base/base_cubit.dart';
import 'package:flashcard/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  /// [AuthenticationOperation] service

  HomeViewModel({required AuthenticationOperation operationService})
    : _authenticationOperationService = operationService,

      super(const HomeState(isLoading: false));

  late final AuthenticationOperation _authenticationOperationService;

  /// Change loading state

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get users

  Future<void> fetchUsers() async {
    final response = await _authenticationOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  // get the users from cache
  Future<void> fetchUsersFromCache() async {
    final cachedUsers = users;
    if (cachedUsers.isNotEmpty) {
      emit(state.copyWith(users: cachedUsers));
    } 
    // else {
    //   await fetchUsers();
    // }
  }

  // delete all users from cache
  Future<void> deleteAllUsersFromCache() async {
    ProductStateItems.productCache.userCacheOperation.clear();
    emit(state.copyWith(users: []));
  }

  void _saveItems(List<User> user) {
    for (final element in user) {
      ProductStateItems.productCache.userCacheOperation.add(
        UserCacheModel(user: element),
      );
    }
  }

  List<User> get users =>
      ProductStateItems.productCache.userCacheOperation
          .getAll()
          .map((e) => e.user)
          .toList();
}
