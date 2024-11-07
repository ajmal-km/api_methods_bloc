import 'dart:developer';

import 'package:api_methods_bloc/models/user_model.dart';
import 'package:api_methods_bloc/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<OnUserLoginEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final url = Uri.parse("https://freeapi.luminartechnohub.com/login");
        var response = await http.post(url,
            body: {"email": event.email, "password": event.password});
        if (response.statusCode == 200) {
          log(response.body.toString());
          UserResModel loginInfo = userResModelFromJson(response.body);
          await AppUtils.setUserTokens(
            accessToken: loginInfo.access,
            refreshToken: loginInfo.refresh,
          );
          emit(LoginSuccesState());
        } else {
          emit(LoginInitialState());
        }
      } catch (e) {
        emit(ErrorState(errormsg: e.toString()));
      }
    });
  }
}
