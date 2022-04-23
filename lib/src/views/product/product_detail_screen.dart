import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/core/core.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/src/view_models/view_models.dart';
import 'package:mobile_test/utils/images.dart';
import 'package:mobile_test/utils/utils.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "/product_detail_screen";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentIndex = 0;
  final ValueNotifier<ColorSelector> _colorSelector = ValueNotifier<ColorSelector>(ColorSelector.one);

  @override
  Widget build(BuildContext context) {
    final _productData = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(body: ResponsiveSafeArea(
      builder: (context, _size) {
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  sliver: SliverAppBar(
                    backgroundColor: Colors.transparent,
                    leadingWidth: 48,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: AppColors.whiteColor.withOpacity(0.6),
                        child: Icon(Icons.arrow_back_ios_outlined,
                            size: 22, color: AppColors.blackColor),
                      )
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: _size.width * 0.06,
                      right: _size.width * 0.06,
                      top: _size.height * 0.03,
                      bottom: _size.height * 0.005),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: _size.height * 0.35,
                    margin: EdgeInsets.only(left: _size.width * 0.15),
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      onTap: (index) {},
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: _size.width * 0.1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: SizedBox.fromSize(
                              size: Size.fromWidth(_size.width * 0.65),
                              child: Image.asset(_productData.images[index],
                                  fit: BoxFit.fill),
                            ),
                          ),
                        );
                      },
                      itemCount: _productData.images.length,
                      viewportFraction: 0.9,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: _size.height * 0.03,
                      horizontal: _size.width * 0.11),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < _productData.images.length;
                                  i++)
                                i == _currentIndex
                                    ? const CustomIndicator(isCurrentPage: true)
                                    : const CustomIndicator(
                                        isCurrentPage: false)
                            ]),
                      ),
                      SizedBox(height: _size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_productData.name,
                                  style: AppTextStyle.textSize22),
                              SizedBox(height: _size.height * 0.0035),
                              Text(_productData.subName,
                                  style: AppTextStyle.textSize22),
                            ],
                          ),
                          Text("${_productData.price.toString()}",
                              style: AppTextStyle.textSize22)
                        ],
                      ),
                      SizedBox(height: _size.height * 0.012),
                      Text(_productData.description,
                          style: AppTextStyle.textSize14),
                      SizedBox(height: _size.height * 0.035),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColorSelectorItem(size: _size, colorSelector: _colorSelector),
                          Container(
                            width: _size.width * 0.25,
                            height: 40,
                            decoration: BoxDecoration(color: Color(0xffF2E0DB),
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: _size.height * 0.0085),
                                  child: Row(
                                    children: [
                                      SizedBox(width: _size.width * 0.042),
                                      Container(
                                        width: _size.width * 0.032,
                                        height: _size.height * 0.004,
                                        margin: EdgeInsets.only(right: _size.width * 0.015),
                                        decoration: BoxDecoration(color: AppColors.darkBlackColor,
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                      ),
                                      SizedBox(width: _size.width * 0.006),
                                      Container(
                                        margin: EdgeInsets.only(top: _size.height * 0.004),
                                        child: Text(_productData.quantity, style: AppTextStyle.textSize16.copyWith(
                                          color: AppColors.darkBlackColor
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(right: 2,
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor: AppColors.darkBlackColor,
                                    child: Icon(Icons.add, color: AppColors.whiteColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
            Positioned(bottom: _size.height * 0.072, left: _size.width * 0.12,
              child: InkWell(
                onTap: (){
                  context.read<ShopBasketViewModel>().addToFavorites(_productData);
                  Flushbar(
                    backgroundColor: Colors.green,
                    flushbarPosition: FlushbarPosition.TOP,
                    title: "Success",
                    message: "Product Added to favorites",
                    duration: const Duration(seconds: 3),
                  ).show(context);
                },
                child: CircleAvatar(radius: 22, backgroundColor: Colors.white,
                child: Icon(Icons.favorite_outline_sharp,
                    color: AppColors.blackColor.withOpacity(0.7)),
            ),
              )),
            Positioned(
                bottom: _size.height * 0.05,
                right: _size.width * 0.05,
                child: Container(height: 72,
                    padding: EdgeInsets.only(left: _size.width * 0.07, right:_size.width * 0.045),
                    decoration: BoxDecoration(
                      color: AppColors.darkBlackColor,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: Offset(0, 10),
                            color: AppColors.blackColor.withOpacity(.05),
                            spreadRadius: -9 // changes position of shadow
                            ),
                      ],
                    ),
                  child: Row(
                    children: [
                      Text("Add to cart", style: AppTextStyle.textSize16.copyWith(
                        fontSize: 17
                      )),
                      SizedBox(width: _size.width * 0.082),
                      InkWell(
                        onTap: (){
                          context.read<ShopBasketViewModel>().addToCart(_productData);
                          Flushbar(
                            backgroundColor: Colors.green,
                            flushbarPosition: FlushbarPosition.TOP,
                            title: "Success",
                            message: "Product Added to cart",
                            duration: const Duration(seconds: 3),
                          ).show(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.blackColor2,
                          child: Icon(Icons.add_shopping_cart,
                              color: AppColors.iceGrey.withOpacity(0.7)),
                        ),
                      )
                    ],
                  ),
                ),
            ),
          ],
        );
      },
    ));
  }
}

class ColorSelectorItem extends StatefulWidget {
  const ColorSelectorItem({Key? key,
    required Size size, required ValueNotifier<ColorSelector> colorSelector
  }): _size = size, _colorSelector = colorSelector, super(key: key);

  final Size _size;
  final ValueNotifier<ColorSelector> _colorSelector;

  @override
  State<ColorSelectorItem> createState() => _ColorSelectorItemState();
}

class _ColorSelectorItemState extends State<ColorSelectorItem> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget._colorSelector,
        builder: (BuildContext context, ColorSelector _colorSelector, Widget? child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
              GestureDetector(
                onTap: () => {
                  widget._colorSelector.value = ColorSelector.one
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _colorSelector == ColorSelector.one ? CircleAvatar(radius: 21,
                      backgroundColor: AppColors.greenColor.withOpacity(0.4),
                    ): Container(),
                    CircleAvatar(radius: 16,
                        backgroundColor: AppColors.greenColor)
                  ],
                ),
              ),
              SizedBox(width: widget._size.width * 0.018),
              GestureDetector(
                onTap: (){
                  widget._colorSelector.value = ColorSelector.two;
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _colorSelector == ColorSelector.two ? CircleAvatar(radius: 21,
                      backgroundColor: AppColors.greenColor.withOpacity(0.4),
                    ): Container(),
                    CircleAvatar(radius: 16,
                        backgroundColor: AppColors.brownColor),
                  ],
                ),
              ),
              SizedBox(width: widget._size.width * 0.018),
              GestureDetector(
                onTap: (){
                  widget._colorSelector.value = ColorSelector.three;
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                   _colorSelector == ColorSelector.three ? CircleAvatar(radius: 21,
                      backgroundColor: AppColors.greenColor.withOpacity(0.4),
                    ): Container(),
                    CircleAvatar(radius: 16,
                        backgroundColor: AppColors.primaryColor2),
                  ],
                ),
              ),
          ],
        );
      }
    );
  }
}
