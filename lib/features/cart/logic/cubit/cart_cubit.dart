import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<Map<int, CartItemModel>> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super({});

  void loadCart() {
    final map = cartRepo.getCachedCartList();
    emit(map);
  }

  // add if not exit
  // update if exit
  // here can br more then 1 qty
  Future<bool> addOrUpdate({
    required ProductModel productModel,
    required int quantityToAdd,
  }) async {
    final productId = productModel.id;

    final CartItemModel? currentCartItem = state[productId];

    // means item not exist
    if (currentCartItem == null) {
      // add
      final newCartItemMode = CartItemModel(
        product: productModel,
        quantity: quantityToAdd,
        addedAt: DateTime.now(),
      );
      await cartRepo.updateOrAddToCart(cartItemModel: newCartItemMode);
      emit({productId: newCartItemMode, ...state});

      return true; //this action means => add
    } else {
      // update
      final updatedQuantity = currentCartItem.quantity + quantityToAdd;
      final updatedItemModel = CartItemModel(
        product: currentCartItem.product,
        quantity: updatedQuantity,
        addedAt: currentCartItem.addedAt,
      );

      final updatedMap = Map<int, CartItemModel>.from(state);
      updatedMap[productId] = updatedItemModel;

      await cartRepo.updateOrAddToCart(cartItemModel: updatedItemModel);
      emit(updatedMap);

      return false; //this action means => update
    }
  }

  // this will call only on cartScreen so 99% item should be exit i think
  Future<void> increaseOrDecrees({
    required int productId,
    required bool isIncrease,
  }) async {
    final updatedMap = Map<int, CartItemModel>.from(state);
    final currentCartItem = state[productId];

    if (currentCartItem == null) return;

    int updatedQty = currentCartItem.quantity;

    if (isIncrease) {
      updatedQty += 1;
    } else {
      updatedQty -= 1;
    }

    final CartItemModel updatedCartItem = CartItemModel(
      product: currentCartItem.product,
      quantity: updatedQty,
      addedAt: currentCartItem.addedAt,
    );

    updatedMap[productId] = updatedCartItem;

    await cartRepo.updateOrAddToCart(cartItemModel: updatedCartItem);
    emit(updatedMap);
  }

  Future<void> deleteProduct({required int productId}) async {
    final updatedMap = Map<int, CartItemModel>.from(state)..remove(productId);
    await cartRepo.deleteProduct(productId: productId);

    emit(updatedMap);
  }

  CartItemModel? getCartItem({required int productId}) => state[productId];

  Future<void> clearCart() async {
    await cartRepo.clearCart();
    emit({});
  }
}
