import 'package:flutter/material.dart';
import 'package:mobile_test/utils/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    Key? key,
    required this.isCurrentPage,
  }) : super(key: key);

  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 10.0,
      width: isCurrentPage ? 12.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? AppColors.primaryColor : AppColors.iceGrey,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
