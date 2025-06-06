
import 'package:flashcard/product/state/base/base_cubit.dart';
import 'package:flashcard/product/state/view_model/product_state.dart';
import 'package:flutter/material.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
