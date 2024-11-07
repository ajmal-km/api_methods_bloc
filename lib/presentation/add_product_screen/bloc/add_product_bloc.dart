import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../utils/app_utils.dart';
import 'add_product_event.dart';
import 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitialState()) {
    on<ProductAddingEvent>((event, emit) async {
      emit(AddingState());
      try {
        final url =
            Uri.parse("https://freeapi.luminartechnohub.com/product-create/");
        var response = await http.post(
          url,
          headers: {
            "Authorization": "Bearer ${await AppUtils.getAccessToken()}"
          },
          body: {
            "name": event.name,
            "description": event.description,
            "price": event.price,
            "stock": event.stock,
            "category": event.category
          },
        );
        if (response.statusCode == 200) {
          log(response.body.toString());
          emit(AddedState());
        } else {
          emit(AddProductInitialState());
        }
      } catch (e) {
        emit(AddProductErrorState(errormsg: e.toString()));
      }
    });
  }
}
