import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState()) {
    on<OnUserRegisterEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final url =
            Uri.parse("https://freeapi.luminartechnohub.com/registration/");
        var response = await http.post(
          url,
          body: {
            "name": event.name,
            "phone": 7746372382,
            "place": "string",
            "pincode": 683567,
            "email": event.email,
            "password": event.password
          },
        );
        if (response.statusCode == 200) {
          log(response.body.toString());
          emit(RegistrationSuccesState());
        } else {
          emit(RegistrationInitialState());
        }
      } catch (e) {
        emit(ErrorState(errormsg: e.toString()));
      }
    });

    on<PasswordObscureEvent>((event, emit) {
      emit(PasswordState(isHidden: event.obscure));
    });
  }
}
