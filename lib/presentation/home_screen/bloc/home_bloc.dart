import 'dart:developer';

import 'package:api_methods_bloc/models/product_res_model.dart';
import 'package:api_methods_bloc/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final url =
            Uri.parse("https://freeapi.luminartechnohub.com/products-all/");
        var response = await http.get(
          url,
          headers: {"Authorization": "Bearer ${await AppUtils.getAccessToken()}"},
        );
        log(response.body.toString());
        if (response.statusCode == 200) {
          ProductResModel resModel = productResModelFromJson(response.body);
          emit(LoadedState(productlist: resModel.products ?? []));
        } else {
          emit(HomeInitialState());
        }
      } catch (e) {
        emit(ErrorState(errormsg: e.toString()));
      }
    });
  }
}
