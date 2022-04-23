import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/core/services/base_db_sevice.dart';
import 'package:mobile_test/utils/images.dart';

class MockDBService extends IMockDBService {
  MockDBService._();

  factory MockDBService() {
    return MockDBService._();
  }

  Stream<List<Product>> getProducts() async* {
    List<Product> allProducts = [];
    var i = 0;
    while (i < _productsInDb.length) {
      await Future.delayed(Duration(milliseconds: 100), () {
        allProducts.add(_productsInDb[i]);
      });
      i++;
      yield allProducts;
    }
  }

}

List<Product> _productsInDb = [
  Product(id: 1, name: "Decor 1", subName: "Candel holders", mainImage: AppImages.decorOne, description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.decor ),
  Product(id: 2, name: "Decor 2", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.decorTwo,
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.decor),
  Product(id: 3, name: "Decor 3", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.decorThree,
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.decor),

  Product(id: 4, name: "Study Chair", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.furniOne,
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree], category: ProductCategory.furniture),
  Product(id: 5, name: "Stool", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.furniTwo,
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree], category: ProductCategory.furniture),
  Product(id: 6, name: "Cool Chair", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.furniThree,
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree], category: ProductCategory.furniture),

  Product(id: 6, name: "Loom 1", subName: "Candel holders", mainImage: AppImages.decorOne, description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5",
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.trending),
  Product(id: 7, name: "Loom 2", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.decorTwo,
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.trending),
  Product(id: 8, name: "Loom 3", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.decorThree,
      images: [ AppImages.decorOne, AppImages.decorTwo, AppImages.decorThree], category: ProductCategory.trending),
  Product(id: 9, name: "Loom 4", subName: "Candel holders", description: "Lorem Ipsum is simply "
      "dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
      "industry's standard dummy text ever since the 1500s", price: "1000", quantity: "5", mainImage: AppImages.furniOne,
      images: [ AppImages.furniOne, AppImages.furniTwo, AppImages.furniThree], category: ProductCategory.trending)
];




