import 'package:flashcard/feature/home/view_model/home_state.dart';
import 'package:flashcard/product/service/interface/authenction_operation.dart';
import 'package:flashcard/product/state/base/base_cubit.dart';

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

    emit(state.copyWith(users: response));
  }
}
