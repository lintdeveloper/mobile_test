import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/core/models/product_model.dart';
import 'package:mobile_test/src/view_models/shop_basket_view_model/shop_basket_view_model.dart';
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
    Size _size1 =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        toolbarHeight: _size1.height * 0.1,
        title: Container(
          margin: EdgeInsets.only(left: _size1.width * 0.06, top: _size1.height * 0.02),
          child: Text("Favorites", style: AppTextStyle.textSize22.copyWith(
              color: AppColors.darkBlackColor.withOpacity(0.8), letterSpacing: 1
          )),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ResponsiveSafeArea(builder: (context, _size){
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer<ShopBasketViewModel>(
                builder: (BuildContext context, ShopBasketViewModel shopBasket, Widget? child)  {
                  if (shopBasket.favoriteProducts.isEmpty) {
                    return Container(
                        height: _size.height * 0.8,
                        child: Center(child: Text('No products in favorites')));
                  };
                  return ListView.separated(shrinkWrap: true,
                    addAutomaticKeepAlives: true, addRepaintBoundaries: true,
                    cacheExtent: 10, itemCount: shopBasket.favoriteProducts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>const Divider(thickness: 0.1,
                          color: AppColors.primaryColor),
                    itemBuilder: (BuildContext context, int index) {
                      final _product = shopBasket.favoriteProducts[index];
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

