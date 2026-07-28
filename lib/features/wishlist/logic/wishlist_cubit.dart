import 'package:ecommerce_app/features/wishlist/logic/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  
 WishlistCubit() : super(const WishlistState.initial());
  
}