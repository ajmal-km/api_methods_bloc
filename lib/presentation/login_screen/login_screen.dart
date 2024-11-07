import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_screen/home_screen.dart';
import '../registration_screen/registration_screen.dart';
import '../widgets/global_widgets.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                ),
                SizedBox(height: 30),
                GlobalWidgets.customTextField(
                  prfixIcon: Icons.email,
                  controller: emailController,
                  textFieldHint: "Email",
                  textFieldValidator: (value) {
                    if (value == null || !value.contains("@")) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                GlobalWidgets.customTextField(
                  prfixIcon: Icons.lock,
                  controller: passwordController,
                  textFieldHint: "Password",
                  textFieldValidator: (value) {
                    if (value == null || value.length < 6) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccesState) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            state.errormsg.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.indigo,
                          ),
                        );
                      }
                      if (state is LoginInitialState) {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(OnUserLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.indigo,
                                ],
                              ),
                            ),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is LoginSuccesState) {
                        return SizedBox();
                      }
                      if (state is ErrorState) {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(OnUserLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.indigo,
                                ],
                              ),
                            ),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
