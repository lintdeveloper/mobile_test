import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/core/services/base_db_sevice.dart';
import 'package:mobile_test/utils/images.dart';

class MockDBService extends IMockDBService {
  MockDBService._();

  factory MockDBService() {
    return MockDBService._();
  }

  Stream<List<Product>> getProductsDecor() async* {
    List<Product> allProducts = [];
    var i = 0;
    while (i < 4) {
      await Future.delayed(Duration(seconds: 3), () {
        allProducts.add(_productsDecorInDb[i]);
      });
      i++;
      yield allProducts;
    }
  }

  Stream<List<Product>> getProductsFurni() async* {
    List<Product> allProducts = [];
    var i = 0;
    while (i < 4) {
      await Future.delayed(Duration(seconds: 3), () {
        allProducts.add(_productsFurniInDb[i]);
      });
      i++;
      yield allProducts;
    }
  }

  Stream<List<Product>> getProductsTrending() async* {
    List<Product> allProducts = [];
    var i = 0;
    while (i < 4) {
      await Future.delayed(Duration(seconds: 3), () {
        allProducts.add(_productsTrendingInDb[i]);
      });
      i++;
      yield allProducts;
    }
  }

}

List<Product> _productsDecorInDb = [
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree])
];

List<Product> _productsFurniInDb = [
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree])
];

List<Product> _productsTrendingInDb = [
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree]),
  Product(name: "Loom", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley "
      "of type and scrambled it to make a type specimen book", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree])
];


