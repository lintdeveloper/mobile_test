
import 'package:flutter/material.dart';
import 'package:mobile_test/src/core/models/models.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/utils.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({Key? key, required Product productData,
    required Size size}) : _productData = productData, _size = size,  super(key: key);

  final Product _productData;
  final Size _size;

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
                SizedBox(width: _size.width * 0.042),
                GestureDetector(
                  onTap: (){
                    if (!(_productData.orderQty! >= int.parse(_productData.quantity)))
                      _productData.orderQty! + 1;
                  },
                  child: Container(
                    width: _size.width * 0.032,
                    height: _size.height * 0.004,
                    margin: EdgeInsets.only(right: _size.width * 0.015),
                    decoration: BoxDecoration(color: AppColors.darkBlackColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),
                SizedBox(width: _size.width * 0.006),
                Container(
                  margin: EdgeInsets.only(top: _size.height * 0.004),
                  child: Text("${_productData.orderQty}", style: AppTextStyle.textSize16.copyWith(
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
    );
  }

  void _increaseOrder(Product product) {
    if (!(_productData.orderQty! >= int.parse(_productData.quantity)))
      _productData.orderQty! + 1;
  }
}