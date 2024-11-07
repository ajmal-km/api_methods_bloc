import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnUserLoginEvent extends LoginEvent {
  final String email;
  final String password;
  OnUserLoginEvent({required this.email, required this.password});
}

class ObscureTextEvent extends LoginEvent {
  final bool obscure;
  ObscureTextEvent({required this.obscure});

  @override
  List<Object> get props => [];
}
