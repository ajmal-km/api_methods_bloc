import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationSuccesState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class PasswordState extends RegistrationState {
  final bool isHidden;
  PasswordState({this.isHidden = true});

  @override
  List<Object> get props => [];
}

class ErrorState extends RegistrationState {
  final String errormsg;
  ErrorState({required this.errormsg});

  @override
  List<Object> get props => [errormsg];
}
