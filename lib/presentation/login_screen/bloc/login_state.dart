import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccesState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginPasswordHiddenState extends LoginState {
  
  @override
  List<Object> get props => [];
}

class ErrorState extends LoginState {
  final String errormsg;
  ErrorState({required this.errormsg});

  @override
  List<Object> get props => [errormsg];
}
