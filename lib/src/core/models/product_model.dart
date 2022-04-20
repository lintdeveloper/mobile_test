import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({required this.name, required this.subName,
    required this.description, this.isLike = false,
    required this.price, required this.quantity,
    required this.images});

  final String name;
  final String subName;
  final String description;
  final bool? isLike;
  final List images;
  final String price;
  final String quantity;

  @override
  List<Object?> get props => [
    name, subName, description, images
  ];
}