import 'package:core/core.dart';
import 'package:flashcard/feature/home/view_model/home_state.dart';
import 'package:flashcard/product/cache/model/user_cache_model.dart';
import 'package:flashcard/product/service/interface/authentication_operation.dart';
import 'package:flashcard/product/state/base/base_cubit.dart';
import 'package:flashcard/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class HomeViewModel extends BaseCubit<HomeState> {
  /// [AuthenticationOperation] service

  HomeViewModel({required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })
    : _authenticationOperationService = operationService,
_userCacheOperation = userCacheOperation,
      super(const HomeState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  /// Change loading state

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get users

  Future<void> fetchUsers() async {
    CustomLogger.showError<User>(usersFromCache);
    final response = await _authenticationOperationService.users();
    // _saveItems(response);
    // print(response);
    emit(state.copyWith(users: response));
  }

  // get the users from cache
  Future<void> fetchUsersFromCache() async {
    final cachedUsers = usersFromCache;
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
      _userCacheOperation.add(UserCacheModel(user: element));
    }
  }

  List<User> get usersFromCache =>
      ProductStateItems.productCache.userCacheOperation
          .getAll()
          .map((e) => e.user)
          .toList();
}
