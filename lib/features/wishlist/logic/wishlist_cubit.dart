import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_app/features/wishlist/data/repos/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<Map<int, WishlistItemModel>> {
  final WishlistRepo wishlistRepo;
  WishlistCubit(this.wishlistRepo) : super({});

  void loadWishlist() {
    final map = wishlistRepo.getCachedWishList();
    emit(map);
  }

  Future<void> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final productId = productModel.id;

    final bool isProductFavorite = isFavorite(productId: productId);

    final wishlistItem = WishlistItemModel(
      product: productModel,
      addedAt: DateTime.now(),
    );

    await wishlistRepo.toggleFavoriteProduct(
      wishlistItemModel: wishlistItem,
      isFavorite: isProductFavorite,
    );

    if (isProductFavorite) {
      // remove
      final updatedMap = Map<int, WishlistItemModel>.from(state)
        ..remove(productId);
      emit(updatedMap);
    } else {
      // add
      emit({productId: wishlistItem, ...state});
    }
  }

  Future<void> removeFromWishlist({required int productId}) async {
    final newMap = Map<int, WishlistItemModel>.from(state);
    newMap.remove(productId);

    await wishlistRepo.removeFromWishlist(productId: productId);
    emit(newMap);
  }

  bool isFavorite({required int productId}) {
    return state.containsKey(productId);
  }

  Future<void> clearWishList() async {
    await wishlistRepo.clearAllFavorite();
    emit({});
  }
}
