
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/view_models.dart';
import 'package:mobile_test/utils/misc.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({Key? key, required Product product,
      required Size size}): _product = product,
        _size = size,  super(key: key);

  final Product _product;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.currency(decimalDigits: 0, symbol: '\$');

    return Container(
      height: 180,
      margin: EdgeInsets.only(left: _size.width * 0.08, top: _size.height * 0.02),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18), // Image border
            child: SizedBox.fromSize(
              size: Size.fromWidth(_size.width * 0.40), // Image radius
              child: Image.asset("${_product.mainImage}", fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${_product.name}", style: AppTextStyle.textSize20.copyWith(
                          color: AppColors.darkBlackColor.withOpacity(0.9))),
                      IconButton(icon: Icon(Icons.close), color: AppColors.primaryColor,
                          onPressed: () {
                        print("HI");
                            context.read<ShopBasketViewModel>().removeFromCart(_product);
                          })
                    ],
                  ),
                  Text("${_product.subName}", style: AppTextStyle.textSize14.copyWith(
                      color: AppColors.blackColor2.withOpacity(0.4))),
                  SizedBox(height: 6),
                  Text("${_product.description}", maxLines: 2,
                      overflow: TextOverflow.ellipsis, style: AppTextStyle.textSize12),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${numberFormat.format(double.parse(_product.price))}", style: AppTextStyle.textSize16.copyWith(
                          color: AppColors.primaryColor
                      )),
                      ProductCounter(productData: _product, size: _size,
                        count: int.parse(_product.orderQty.toString()), increaseTap: (){

                        }, decreaseTap: (){

                        })
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}