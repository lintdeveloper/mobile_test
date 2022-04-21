import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/core/services/mock_db_service.dart';
import 'base_store_view_model.dart';

class StoreViewModel extends IStoreViewModel with ChangeNotifier {
  StreamController<List<Product>> _trendingStreamController = StreamController<List<Product>>();
  Stream<List<Product>>? get getAllTrendingForSale => _trendingStreamController.stream;

  StoreViewModel() {
    _trendingStreamController.add(<Product>[]);
    _initTrending();
  }

  void _initTrending() {
    MockDBService().getProductsTrending().listen((List<Product> products) {
      _trendingStreamController.add(products);
    });
  }

  @override
  void dispose() {
    _trendingStreamController.close();
    super.dispose();
  }
}