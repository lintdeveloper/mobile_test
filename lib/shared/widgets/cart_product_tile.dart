
import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/view_models.dart';
import 'package:mobile_test/utils/misc.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class CartProductTile extends StatelessWidget {
  const CartProductTile({
    Key? key, required Product product, required Size size
  }) : _product = product, _size = size,  super(key: key);

  final Product _product;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
                  Text("${_product.name}", style: AppTextStyle.textSize20.copyWith(
                      color: AppColors.darkBlackColor.withOpacity(0.9))),
                  Text("${_product.subName}", style: AppTextStyle.textSize14.copyWith(
                      color: AppColors.blackColor2.withOpacity(0.4))),
                  SizedBox(height: 6),
                  Text("${_product.description}", maxLines: 2,
                      overflow: TextOverflow.ellipsis, style: AppTextStyle.textSize12),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${getCurrency("USD")}${_product.price}", style: AppTextStyle.textSize16.copyWith(
                          color: AppColors.primaryColor
                      )),
                      InkWell(onTap: () => context.read<ShopBasketViewModel>().removeFromFavorite(_product),
                          child: Icon(Icons.delete_outline_sharp, color: AppColors.primaryColor))
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