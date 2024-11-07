import 'package:equatable/equatable.dart';

class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class OnUserRegisterEvent extends RegistrationEvent {
  final String name;
  final String email;
  final String password;
  OnUserRegisterEvent(
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class PasswordObscureEvent extends RegistrationEvent {
  final bool obscure;
  PasswordObscureEvent({required this.obscure});

  @override
  List<Object> get props => [];
}
