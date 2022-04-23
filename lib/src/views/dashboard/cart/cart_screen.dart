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
        return CustomScrollView(
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
                          return FavoriteProductTile(product: _product, size: _size);
                        });
                  }),
            )
          ],
        );
      }),
    );
  }
}
