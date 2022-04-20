import 'package:flutter/material.dart';
import 'package:mobile_test/utils/colors.dart';

class CustomFoundation extends StatelessWidget {
  const CustomFoundation({Key? key,
    required this.backgroundColor, required this.child})
      : super(key: key);
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: AppColors.primaryColor,
            )
        ),
        body: SafeArea(child: child));
  }
}
