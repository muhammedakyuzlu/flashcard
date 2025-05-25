
import 'package:bloc_test/bloc_test.dart';
import 'package:flashcard/feature/home/view_model/home_state.dart';
import 'package:flashcard/feature/home/view_model/home_view_model.dart';
import 'package:flashcard/product/cache/model/user_cache_model.dart';
import 'package:flashcard/product/init/index.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/login_service_mock.dart';
import 'mock/user_cache_mock.dart';

void main() {
  late HomeViewModel homeViewModel;
  // register UserCacheModel in the hive

  setUp(() {
    homeViewModel = HomeViewModel(
      operationService: LoginServiceMock(),
      userCacheOperation: UserCacheMock(),
    );
  });  
  group('Home View Model Test', () {
    test('inital state is loading', () {
      expect(homeViewModel.state.isLoading, false);
    });

    blocTest<HomeViewModel, HomeState>(
      'change loading state',

      build: () => homeViewModel,

      act: (bloc) => bloc.changeLoading(),

      expect:
          () => [
            isA<HomeState>().having(
              (state) => state.isLoading,
              'isLoading',
              true,
            ),
          ],
    );
  // TODO: fix this test  
  //   blocTest<HomeViewModel, HomeState>(
  //     'fetch users',

  //     build: () => homeViewModel,

  //     act: (bloc) async => bloc.fetchUsers(),

  //     expect:
  //         () => [
  //           isA<HomeState>().having(
  //             (state) => state.users,
  //             'users',
  //             isNotEmpty,
  //           ),
  //         ],
  //   );

  //   test('Check database for items', () async {
  //     await homeViewModel.fetchUsers();

  //     expect(homeViewModel.usersFromCache, isNotEmpty);
  //   });
  });
}
