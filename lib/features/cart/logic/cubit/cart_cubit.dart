import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/data/repos/cart_repo.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super([]) {
    loadCart();
  }

  void loadCart() {
    final list = cartRepo.getCachedCartList();
    emit(list);
  }

  Future<void> addOrUpdate({required CartItemModel cartItemModel}) async {
    final productId = cartItemModel.product.id;

    final currentList = state;

    final index = currentList.indexWhere((e) => e.product.id == productId);

    // add to list if not exit
    if (index == -1) {
      await cartRepo.updateOrAddToCart(cartItemModel: cartItemModel);
      emit([...state, cartItemModel]);
      return;
    }

    // Update it if exit
    final existing = currentList[index];
    final updatedItem = CartItemModel(
      product: existing.product,
      quantity: existing.quantity + cartItemModel.quantity,
    );

    currentList[index] = updatedItem;

    await cartRepo.updateOrAddToCart(cartItemModel: updatedItem);

    emit([...currentList]);
  }

  Future<void> addOrMinus({required int productId, required bool isAdd}) async {
    final currentList = state;

    final index = currentList.indexWhere((e) => e.product.id == productId);

    if (index == -1) return; // if not exist

    final currentCartItem = currentList[index];

    int newQuantity = currentCartItem.quantity;
    newQuantity = isAdd ? newQuantity + 1 : newQuantity - 1;

    final updatedItem = CartItemModel(
      product: currentCartItem.product,
      quantity: newQuantity,
    );

    currentList[index] = updatedItem;

    // change it also in storage
    await cartRepo.updateOrAddToCart(cartItemModel: updatedItem);

    emit([...currentList]);
  } 

  Future<void> deleteProduct({required int productId}) async {
    final currentList = state;
    currentList.removeWhere((e) => e.product.id == productId);

    // delete also in storage
    await cartRepo.deleteProduct(productId: productId);

    emit([...currentList]);
  }

  Future<void> clearCart() async {
    // clear it also in storage
    await cartRepo.clearCart();

    emit([]);
  }
}
