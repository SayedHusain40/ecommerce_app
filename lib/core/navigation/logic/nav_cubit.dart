import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<NavModel> {
  NavCubit() : super(NavModel(screenIndex: 0, categoryIndex: 0));

  void changeNav({
    required int selectedNav,
    int? categoryIndex,
    String? categoryName,
  }) {
    emit(
      NavModel(
        screenIndex: selectedNav,
        categoryIndex: state.categoryIndex,
        categoryName: state.categoryName,
      ),
    );
  }

  /// Explicitly pick a category (or null = "All") and jump to Products tab.
  void selectCategory({required int categoryIndex, String? categoryName}) {
    emit(
      NavModel(
        screenIndex: 1,
        categoryIndex: categoryIndex,
        categoryName: categoryName,
      ),
    );
  }

  /// Reset back to the Home tab with no category selected.
  /// Call this on logout so the next login always starts on Home.
  void reset() {
    emit(NavModel(screenIndex: 0, categoryIndex: 0));
  }
}

class NavModel {
  final int screenIndex;
  final int categoryIndex;
  final String? categoryName;

  NavModel({
    required this.screenIndex,
    this.categoryName,
    required this.categoryIndex,
  });
}
