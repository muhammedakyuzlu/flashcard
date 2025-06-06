import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flashcard/feature/home/view/mixin/home_view_mixin.dart';
import 'package:flashcard/feature/home/view/widget/home_user_list.dart';
import 'package:flashcard/feature/home/view_model/home_state.dart';
import 'package:flashcard/feature/home/view_model/home_view_model.dart';
import 'package:flashcard/product/init/config/app_environment.dart';
import 'package:flashcard/product/init/language/locale_keys.g.dart';
import 'package:flashcard/product/init/product_localization.dart';
import 'package:flashcard/product/state/base/base_state.dart';
import 'package:flashcard/product/utility/constants/enums/locales.dart';
import 'package:flashcard/product/widget/padding/project_padding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
/// HomeView is the main view of the application.
class HomeView extends StatefulWidget {
  /// HomeView constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,

      child: Scaffold(
        appBar: const HomeAppBar(),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () async {
                if (!kDebugMode) {
                  // Code that runs when NOT in debug mode (e.g., release mode)
                  print('Running in release mode or non-debug mode');
                } else {
                  // Code that runs when in debug mode
                  print('Running in debug mode');
                }

                // _users = await loginService.users();
                await homeViewModel.fetchUsers();

                setState(() {});

                // SuccessDialog.show(title: 'title', context: context);
              },
              child: Text('Fetch Users From API'),
            ),
            const Text('Home View'),
            ElevatedButton(
              onPressed: () {
                // language change
                ProductLocalization.updateLanguage(
                  context: context,
                  value: Locales.en,
                );
              },
              child: const Text(LocaleKeys.general_button_save).tr(),
            ),

            // change theme
            ElevatedButton(
              onPressed: () {
                productViewModel.changeThemeMode(
                  productViewModel.state.themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light,
                );

              },
              child: const Text('change theme'),
            ),

                        // change theme
            ElevatedButton(
              onPressed: () async {
                await homeViewModel.deleteAllUsersFromCache();
              },
              child: const Text('Delete All Users Cache'),
            ),
                        // change theme
            ElevatedButton(
              onPressed: () async {
                await homeViewModel.fetchUsersFromCache();
              },
              child: const Text('Fetch Users From Cache'),
            ),


            


            Container(
              height: 200,
              width: 200,
              // color: Theme.of(context).colorScheme.primary,
              color: context.general.colorScheme.secondary,
              child: Center(
                child: Text(
                  'Container',
                  style: context.general.textTheme.titleLarge,
                ),
              ),
            ),
            Assets.icons.iconCloseEye.svg(
              package: 'gen',
              color: context.general.colorScheme.primary,
            ),
            Assets.lottie.lottieChangeTheme.lottie(
              package: 'gen',
              height: 100,
              width: 100,
            ),
            ElevatedButton(
              onPressed: () {
                SuccessDialog.show(title: 'Success', context: context);
              },
              child: const Text('Go to Home View'),
            ),
            Padding(
              padding: const ProjectPadding.allNormal(),
              child: AdaptAllView(
                phone: Text(
                  ''.ext.version,
                  style: context.general.textTheme.titleLarge,
                ),
                tablet: Text(
                  ''.ext.version,
                  style: context.general.textTheme.bodyLarge,
                ),
                desktop: Text(
                  ''.ext.version,
                  style: context.general.textTheme.headlineLarge,
                ),
              ),
            ),
            const Expanded(child: _UserBlocList()),
          ],
        ),
      ),
    );
  }
}

final class _UserBlocList extends StatelessWidget {
  const _UserBlocList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},

      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },

        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();

          return  HomeUserList(users: state);
        },
      ),
    );
  }
}
