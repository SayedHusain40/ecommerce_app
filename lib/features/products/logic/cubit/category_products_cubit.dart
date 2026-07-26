import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/products/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortOptions {
  alphabeticalAZ("Alphabetical (A-Z)", "title", "asc"),
  alphabeticalZA("Alphabetical (Z-A)", "title", "desc"),
  priceHighToLow("Price (High to Low)", "price", "desc"),
  priceLowToHigh("Price (Low to High)", "price", "asc"),
  ratingHighToLow("Rating (High to Low)", "rating", "desc"),
  ratingLowToHigh("Rating (Low to High)", "rating", "asc"),
  discountHighToLow("Discount (High to Low)", "discountPercentage", "desc"),
  discountLowToHigh("Discount (Low to High)", "discountPercentage", "asc"),
  stockHighToLow("Stock (High to Low)", "stock", "desc");

  final String displayName;
  final String sortBy;
  final String order;
  const SortOptions(this.displayName, this.sortBy, this.order);
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
