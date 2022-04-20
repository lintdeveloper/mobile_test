import 'package:mobile_test/src/core/models/models.dart';

abstract class IMockDBService {
  Stream<List<Product>> getProductsDecor();
  Stream<List<Product>> getProductsFurni();
  Stream<List<Product>> getProductsTrending();
}