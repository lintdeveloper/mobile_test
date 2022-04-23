import 'package:flutter/material.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({
    Key? key, required this.content
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.65,
        child: Center(child: Text(content)));
  }
}