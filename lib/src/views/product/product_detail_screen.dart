import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/product_detail_screen";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSafeArea(builder: (context, _size) {
        return Container();
      }
    ));
  }
}
