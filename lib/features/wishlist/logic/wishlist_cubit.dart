import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/wishlist/data/repos/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<List<ProductModel>> {
  final WishlistRepo wishlistRepo;
  WishlistCubit(this.wishlistRepo) : super(<ProductModel>[]) {
    loadWishlist(); // load immediately when the Cubit is created
  }

  void loadWishlist() {
    final list = wishlistRepo.getCachedWishList();
    emit(list);
  }

  Future<void> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final wasAdded = await wishlistRepo.toggleFavoriteProduct(
      productModel: productModel,
    );

    if (wasAdded) {
      emit([...state, productModel]);
    } else {
      emit(state.where((e) => e.id != productModel.id).toList());
    }
  }

  Future<void> removeFromWishlist({required int productId}) async {
    await wishlistRepo.removeFromWishlist(productId: productId);
    emit(state.where((e) => e.id != productId).toList());
  }

  bool isFavorite({required int productId}) {
    return state.any((e) => e.id == productId);
  }

  Future<void> clearWishList() async {
    await wishlistRepo.clearAllFavorite();
    emit(const []);
  }
}