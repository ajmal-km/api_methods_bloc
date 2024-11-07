import 'package:equatable/equatable.dart';

class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class ProductAddingEvent extends AddProductEvent {
  final String name;
  final String description;
  final String price;
  final int stock;
  final String category;
  ProductAddingEvent({
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.name,
  });

  @override
  List<Object> get props => [];
}
