import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/view_models.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem(this.size, {Key? key,
    required this.product}) : super(key: key);

  final Size size;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final _size = size;

    return Container(
      margin: EdgeInsets.only(right: _size.width * 0.08),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18), // Image border
            child: SizedBox.fromSize(
              size: Size.fromWidth(_size.width * 0.65), // Image radius
              child: Image.asset("${product?.mainImage}", fit: BoxFit.fill),
            ),
          ),
          Positioned(
            bottom: 6,
            child: Container(
              width: _size.width * 0.65,
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.04, vertical: _size.height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product?.name}", style: AppTextStyle.textSize16.copyWith(color: AppColors.iceGrey2.withOpacity(0.9),
                          fontWeight: FontWeight.bold)),
                      Text("${product?.subName}", style: AppTextStyle.textSize16.copyWith(color: AppColors.iceGrey2.withOpacity(0.9),
                          fontWeight: FontWeight.bold))
                    ],
                  ),
                  InkWell(onTap: () {
                    context.read<ShopBasketViewModel>().addToFavorites(product!);
                    Flushbar(
                      backgroundColor: Colors.green,
                      flushbarPosition: FlushbarPosition.TOP,
                      title: "Success",
                      message: "Product Added to favorites",
                      duration: const Duration(seconds: 3),
                    ).show(context);
                  }, child: Icon(Icons.favorite_outline, color: AppColors.iceGrey2.withOpacity(0.9)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}