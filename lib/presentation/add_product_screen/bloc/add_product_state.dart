import 'package:equatable/equatable.dart';

class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitialState extends AddProductState {}

class AddingState extends AddProductState {}

class AddedState extends AddProductState {}

class AddProductErrorState extends AddProductState {
  final String errormsg;
  AddProductErrorState({required this.errormsg});

  @override
  List<Object> get props => [];
}
