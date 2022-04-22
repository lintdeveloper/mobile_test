import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_test/shared/widgets/product_card_item.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/store_view_model/store_view_model.dart';
import 'package:mobile_test/src/views/product/product.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/text_style.dart';
import 'package:provider/provider.dart';

class DecorView extends StatefulWidget {
  const DecorView({Key? key}) : super(key: key);

  @override
  State<DecorView> createState() => _DecorViewState();
}

class _DecorViewState extends State<DecorView> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final _products = context.watch<List<Product>>().where((product) =>
    product.category == ProductCategory.decor).toList();

    return  Container(margin: EdgeInsets.only( left: _size.width * 0.14 ),
        child: ListView.builder(scrollDirection: Axis.horizontal,
            itemCount: _products.length, itemBuilder: (context, index) {
              final _product = _products[index];
              return InkWell(onTap: () => Navigator.pushNamed(context, ProductDetailScreen.routeName),
                  child: ProductCardItem(_size, product: _product));
            })
    );
  }

}
