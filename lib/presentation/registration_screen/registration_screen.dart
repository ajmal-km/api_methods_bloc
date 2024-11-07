import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_screen/login_screen.dart';
import '../widgets/global_widgets.dart';
import 'bloc/registration_bloc.dart';
import 'bloc/registration_event.dart';
import 'bloc/registration_state.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
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
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                ),
                SizedBox(height: 30),
                GlobalWidgets.customTextField(
                  controller: nameController,
                  prfixIcon: Icons.person,
                  textFieldHint: "Name",
                  textFieldValidator: (value) {
                    if (value == null || value.length < 1) {
                      return "Enter valid name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                GlobalWidgets.customTextField(
                  controller: emailController,
                  prfixIcon: Icons.email,
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
                  hidden: true,
                  sufixIcon: Icons.remove_red_eye,
                  controller: passwordController,
                  prfixIcon: Icons.lock,
                  textFieldHint: "Password",
                  textFieldValidator: (value) {
                    if (value == null || value.length < 6) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                GlobalWidgets.customTextField(
                  hidden: true,
                  sufixIcon: Icons.remove_red_eye,
                  controller: confirmPasswordController,
                  prfixIcon: Icons.lock,
                  textFieldHint: "Confirm Password",
                  textFieldValidator: (value) {
                    if (value == null || value != passwordController.text) {
                      return "Password doesn't match!";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),
                BlocListener<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationSuccesState) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.indigo,
                          ),
                        );
                      }
                      if (state is RegistrationSuccesState) {
                        return SizedBox();
                      }
                      if (state is RegistrationInitialState) {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<RegistrationBloc>().add(
                                  OnUserRegisterEvent(
                                      name: nameController.text,
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
                              "REGISTER",
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
                      if (state is ErrorState) {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<RegistrationBloc>().add(
                                  OnUserRegisterEvent(
                                      name: nameController.text,
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
                              "REGISTER",
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
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text(
                      "Already have an account",
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
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
