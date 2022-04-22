import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/core/services/mock_db_service.dart';
import 'base_store_view_model.dart';

class StoreViewModel extends IStoreViewModel with ChangeNotifier {
  StreamController<List<Product>> _productsStreamController = StreamController<List<Product>>.broadcast();
  Stream<List<Product>>? get getAllProducts => _productsStreamController.stream;

  StoreViewModel() {
    _productsStreamController.add(<Product>[]);
    _initTrending();
  }

  void _initTrending() {
    MockDBService().getProducts().listen((List<Product> products) {
      _productsStreamController.add(products);
    });
  }

  @override
  void disposeTrending() {
    _productsStreamController.close();
    super.dispose();
  }
}