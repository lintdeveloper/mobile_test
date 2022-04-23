
import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/utils.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({Key? key, required Product productData,
    required this.increaseTap, required this.decreaseTap, required this.count,
    required Size size}) : _size = size,  super(key: key);

  final Size _size;
  final VoidCallback increaseTap;
  final VoidCallback decreaseTap;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                SizedBox(width: _size.width * 0.032),
                GestureDetector(
                    onTap: decreaseTap,
                    child: Icon(Icons.remove, color: AppColors.darkBlackColor, size: 22,)),
                SizedBox(width: _size.width * 0.005),
                Container(
                  margin: EdgeInsets.only(top: _size.height * 0.004),
                  child: Text("${count}", style: AppTextStyle.textSize16.copyWith(
                      color: AppColors.darkBlackColor
                  )),
                )
              ],
            ),
          ),
          Positioned(right: 2,
            child: GestureDetector(
              onTap: increaseTap,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: AppColors.darkBlackColor,
                child: Icon(Icons.add, color: AppColors.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}