import 'package:flutter/material.dart';
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
                        return ListView.separated(shrinkWrap: true,
                            addAutomaticKeepAlives: true, addRepaintBoundaries: true,
                            cacheExtent: 10, itemCount: _products.length,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const Divider(thickness: 0.1,
                                color: AppColors.primaryColor),
                            itemBuilder: (BuildContext context, int index) {
                              final _product = _products[index];
                              return CartProductTile(product: _product, size: _size);
                            });
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
                right: _size.width * 0.08,
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
                                Text("\$1000", style: AppTextStyle.textSize16.copyWith(color: AppColors.whiteColor)),
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
                ),
                // child: Container(height: 72,
                //   padding: EdgeInsets.only(left: _size.width * 0.07, right:_size.width * 0.045),
                //   decoration: BoxDecoration(
                //     color: AppColors.darkBlackColor,
                //     borderRadius: BorderRadius.circular(25.0),
                //     boxShadow: [
                //       BoxShadow(
                //           blurRadius: 15,
                //           offset: Offset(0, 10),
                //           color: AppColors.blackColor.withOpacity(.05),
                //           spreadRadius: -9 // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: Row(
                //     children: [
                //       Text("Add to cart", style: AppTextStyle.textSize16.copyWith(
                //           fontSize: 17
                //       )),
                //       SizedBox(width: _size.width * 0.082),
                //       InkWell(
                //         onTap: (){
                //           // context.read<ShopBasketViewModel>().addToCart(_productData);
                //           // Flushbar(
                //           //   backgroundColor: Colors.green,
                //           //   flushbarPosition: FlushbarPosition.TOP,
                //           //   title: "Success",
                //           //   message: "Product Added to cart",
                //           //   duration: const Duration(seconds: 3),
                //           // ).show(context);
                //         },
                //         child: CircleAvatar(
                //           backgroundColor: AppColors.blackColor2,
                //           child: Icon(Icons.add_shopping_cart,
                //               color: AppColors.iceGrey.withOpacity(0.7)),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              );
            })
          ],
        );
      }),
    );
  }
}
