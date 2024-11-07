import 'package:api_methods_bloc/presentation/home_screen/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/add_product_screen/bloc/add_product_bloc.dart';
import 'presentation/home_screen/bloc/home_bloc.dart';
import 'presentation/login_screen/bloc/login_bloc.dart';
import 'presentation/registration_screen/bloc/registration_bloc.dart';
import 'presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegistrationBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBloc()..add(GetProductsEvent())),
        BlocProvider(create: (context) => AddProductBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
