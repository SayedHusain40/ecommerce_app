class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = "https://dummyjson.com";
}

class ApiEndPoints {
  const ApiEndPoints._();

  static const categories = '/products/categories';
  static const product = '/products/{id}';
  static const products = '/products';
  static const productsByCategory = '/products/category/{category}';
  static const searchProducts = '/products/search';
}

class ApiKeys {
  const ApiKeys._();
}
