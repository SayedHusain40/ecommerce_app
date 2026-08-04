import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/products/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortOptions {
  alphabeticalAZ("title", "asc"),
  alphabeticalZA("title", "desc"),
  priceHighToLow("price", "desc"),
  priceLowToHigh("price", "asc"),
  ratingHighToLow("rating", "desc"),
  ratingLowToHigh("rating", "asc"),
  discountHighToLow("discountPercentage", "desc"),
  discountLowToHigh("discountPercentage", "asc"),
  stockHighToLow("stock", "desc");

  final String sortBy;
  final String order;
  const SortOptions(this.sortBy, this.order);

  String displayName(AppLocalizations l10n) {
    switch (this) {
      case SortOptions.alphabeticalAZ:
        return l10n.sortAlphabeticalAZ;
      case SortOptions.alphabeticalZA:
        return l10n.sortAlphabeticalZA;
      case SortOptions.priceHighToLow:
        return l10n.sortPriceHighToLow;
      case SortOptions.priceLowToHigh:
        return l10n.sortPriceLowToHigh;
      case SortOptions.ratingHighToLow:
        return l10n.sortRatingHighToLow;
      case SortOptions.ratingLowToHigh:
        return l10n.sortRatingLowToHigh;
      case SortOptions.discountHighToLow:
        return l10n.sortDiscountHighToLow;
      case SortOptions.discountLowToHigh:
        return l10n.sortDiscountLowToHigh;
      case SortOptions.stockHighToLow:
        return l10n.sortStockHighToLow;
    }
  }
}

class CategoryProductsCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  CategoryProductsCubit(this.productRepo) : super(const ProductState.initial());

  String? selectedCategoryName;
  SortOptions? selectedSortOptions;

  Future<void> getProducts({int? limit}) async {
    emit(const ProductState.loading());
    final result = await productRepo.getProducts(
      limit: limit,
      sortBy: selectedSortOptions?.sortBy,
      order: selectedSortOptions?.order,
    );
    if (isClosed) return;
    result.when(
      success: (data) => emit(ProductState.success(data)),

      failure: (f) => emit(ProductState.failure(f)),
    );
  }

  void setSortOptions(SortOptions? newSortOption) =>
      selectedSortOptions = newSortOption;

  Future<void> getProductsByCategory({
    required String categoryName,
    int? limit,
  }) async {
    selectedCategoryName = categoryName;
    selectedSortOptions = null; // for reset
    emit(const ProductState.loading());

    final result = await productRepo.getProductsByCategory(
      categoryName: categoryName,
      limit: limit,
    );

    result.when(
      success: (data) => emit(ProductState.success(data)),
      failure: (f) => emit(ProductState.failure(f)),
    );
  }

  // i make it separate one for reset when select a category when apply filter
  Future<void> getProductsByCategorySort({
    required String categoryName,
    int? limit,
  }) async {
    selectedCategoryName = categoryName;

    emit(const ProductState.loading());

    final result = await productRepo.getProductsByCategory(
      categoryName: categoryName,
      limit: limit,
      sortBy: selectedSortOptions?.sortBy,
      order: selectedSortOptions?.order,
    );

    result.when(
      success: (data) => emit(ProductState.success(data)),
      failure: (f) => emit(ProductState.failure(f)),
    );
  }
}