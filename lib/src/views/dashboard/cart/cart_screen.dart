import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/view_models.dart';
import 'package:mobile_test/utils/constants.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final numberFormat = NumberFormat.currency(decimalDigits: 0, symbol: '\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: cartText),
      body: ResponsiveSafeArea(builder: (context, _size){
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Consumer<ShopBasketViewModel>(
                      builder: (BuildContext context, ShopBasketViewModel shopBasket, Widget? child)  {
                        List<Product> _products = shopBasket.productsInCart.toList();
                        if (_products.isEmpty) {
                          return EmptyProductView(content: noProductInCartText);
                        };
                        return Column(
                          children: [
                            ListView.separated(shrinkWrap: true,
                                addAutomaticKeepAlives: true, addRepaintBoundaries: true,
                                cacheExtent: 10, itemCount: _products.length,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) => const Divider(thickness: 0.1,
                                    color: AppColors.primaryColor),
                                itemBuilder: (BuildContext context, int index) {
                                  final _product = _products[index];
                                  return CartProductTile(product: _product, size: _size);
                                }),
                            //White space
                            Container(
                              height: _size.height * 0.15,
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
            Consumer<ShopBasketViewModel>(builder: (BuildContext context, ShopBasketViewModel shopBasket, Widget? child) {
              List<Product> _products = shopBasket.productsInCart.toList();
              if (_products.isEmpty) {
                return Container();
              };
              return Positioned(
                bottom: _size.height * 0.00,
                right: _size.width * 0.1,
                left: _size.width * 0.1,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 63,
                        width: _size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${numberFormat.format(shopBasket.totalInCart)}", style: AppTextStyle.textSize16.copyWith(color: AppColors.whiteColor)),
                                Text("Place Order", style: AppTextStyle.textSize16.copyWith(color: AppColors.whiteColor)),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.darkBlackColor,
                              minimumSize: const Size(double.infinity, 65),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0.1,
                              shadowColor: Colors.transparent
                          ),
                        ),
                      )
                    ],
                  ),
                )
              );
            })
          ],
        );
      }),
    );
  }
}
