import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/images.dart';
import 'package:mobile_test/utils/text_style.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return  Container(
        margin: EdgeInsets.only( left: _size.width * 0.14 ),
        child: ListView.builder(scrollDirection: Axis.horizontal,
            itemCount: 3, itemBuilder: (context, index) {
              return _productCardItem(_size);

        }));
  }
}

Widget _productCardItem(Size size) {
  final _size = size;
  return Container(
    margin: EdgeInsets.only(right: _size.width * 0.08),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18), // Image border
          child: SizedBox.fromSize(
            size: Size.fromWidth(_size.width * 0.65), // Image radius
            child: Image.asset(AppImages.decorThree, fit: BoxFit.fill),
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
                    Text("Noom", style: AppTextStyle.textSize16.copyWith(color: AppColors.iceGrey2.withOpacity(0.9),
                        fontWeight: FontWeight.bold)),
                    Text("Candle Holders", style: AppTextStyle.textSize16.copyWith(color: AppColors.iceGrey2.withOpacity(0.9),
                        fontWeight: FontWeight.bold))
                  ],
                ),
                Icon(Icons.favorite_outline, color: AppColors.iceGrey2.withOpacity(0.9))
              ],
            ),
          ),
        )
      ],
    ),
  );
}
