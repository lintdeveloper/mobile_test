import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'base_shop_basket_view_model.dart';

class ShopBasketViewModel extends IShopBasketViewModel with ChangeNotifier {
  Set<Product> productsInCart = {};
  Set<Product> favoriteProducts = {};

  double get totalInCart {
    return productsInCart.fold(0.0, (double currentTotal, Product nextProduct) {
      double _cost = double.parse(nextProduct.orderQty.toString()) * double.parse(nextProduct.price);
      return currentTotal + _cost;
    });
  }


  void addToCart(Product product) => productsInCart.add(product);
  void removeFromCart(Product product) {
    productsInCart.remove(product);
    notifyListeners();
  }

  void addToFavorites(Product product) => favoriteProducts.add(product);
  bool checkIsFavorite(Product product) => favoriteProducts.contains(product);


  void removeFromFavorite(Product product) {
    favoriteProducts.remove(product);
    notifyListeners();
  }
}