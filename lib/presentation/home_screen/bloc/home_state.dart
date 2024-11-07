import 'package:api_methods_bloc/models/product_res_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

final class LoadingState extends HomeState {}

final class LoadedState extends HomeState {
  final List<Product> productlist;
  LoadedState({this.productlist = const []});

  @override
  List<Object> get props => [productlist];
}

final class ErrorState extends HomeState {
  final String errormsg;
  ErrorState({required this.errormsg});

  @override
  List<Object> get props => [errormsg];
}
