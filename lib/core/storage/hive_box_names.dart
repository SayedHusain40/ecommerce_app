class HiveBoxNames {
  const HiveBoxNames._();

  static String wishlist(String uid) => 'wishlist_$uid';
  static String cart(String uid) => 'cart_$uid';
  static String order(String uid) => 'order_$uid';
  static String address(String uid) => 'address_$uid';
}