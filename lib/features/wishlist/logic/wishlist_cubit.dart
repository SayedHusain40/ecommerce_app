import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/wishlist/data/repos/wishlist_repo.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo wishlistRepo;
  WishlistCubit(this.wishlistRepo) : super(const WishlistState.initial());

  void loadWishlist() {
    emit(const WishlistState.loading());
    final list = wishlistRepo.getCachedWishList();
    emit(WishlistState.success(list));
  }

  Future<void> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    await wishlistRepo.toggleFavoriteProduct(productModel: productModel);
    loadWishlist(); // re-fetch + emit updated list
  }

  Future<void> removeFromWishlist({required int productId}) async {
    await wishlistRepo.removeFromWishlist(productId: productId);
    loadWishlist();
  }

  bool isFavorite({required int productId}) {
    return wishlistRepo.isFavorite(productId: productId);
  }

  Future<void> clearWishList() async {
    wishlistRepo.clearAllFavorite();
    loadWishlist();
  }

  int countFavorites() {
    return wishlistRepo.countFavorites();
  }
}
