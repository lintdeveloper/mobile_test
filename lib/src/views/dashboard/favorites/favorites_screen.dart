import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/shared/widgets/empty_product_view.dart';
import 'package:mobile_test/src/core/models/product_model.dart';
import 'package:mobile_test/src/view_models/shop_basket_view_model/shop_basket_view_model.dart';
import 'package:mobile_test/utils/constants.dart';
import 'package:mobile_test/utils/misc.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: favoriteText),
      body: ResponsiveSafeArea(builder: (context, _size){
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer<ShopBasketViewModel>(
                builder: (BuildContext context, ShopBasketViewModel shopBasket, Widget? child)  {
                  List<Product> _products = shopBasket.favoriteProducts.toList();

                  if (_products.isEmpty) {
                    return EmptyProductView(content: noProductInFavoriteText);
                  };
                  return ListView.separated(shrinkWrap: true,
                    addAutomaticKeepAlives: true, addRepaintBoundaries: true,
                    cacheExtent: 10, itemCount: shopBasket.favoriteProducts.length,
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



