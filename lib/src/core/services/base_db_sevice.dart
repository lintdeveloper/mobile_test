import 'package:mobile_test/src/core/models/models.dart';

abstract class IMockDBService {
  Stream<List<Product>> getProducts();
}