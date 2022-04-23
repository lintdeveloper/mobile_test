import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/utils/utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: ResponsiveSafeArea(
        builder: (context, _size) {
          return Container();
        }
      ),
    );
  }
}
