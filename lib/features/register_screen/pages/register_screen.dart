import 'dart:developer';

import 'package:books/features/home_screen/widgets/book_grid.dart';
import 'package:books/features/register_screen/bloc/register_bloc.dart';
import 'package:books/features/register_screen/widgets/custom_icon_widget.dart';
import 'package:books/features/register_screen/widgets/custom_snackbar.dart';
import 'package:books/features/register_screen/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../home_screen/pages/bottom_nav_screen.dart';

class RegistrationFormPage extends StatefulWidget {
  const RegistrationFormPage({super.key});

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final RegisterBloc _registerBloc = RegisterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          listener: (context, state) {
            if (state is RegisterErrorState) {
              showCustomSnackbar(context, state.errorMsg, false);
            } else if (state is RegisterSuccessState) {
              showCustomSnackbar(context, 'Registered Successfully');

              context.replace('/bottomnav');
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                customIconWidget(),
                const Spacer(),
                // Username Field
                customTextField(
                    label: 'Username', controller: _usernameController),

                // Password Field
                customPasswordTextField(
                    label: 'Password', controller: _passwordController),

                // Confirm Password Field
                customPasswordTextField(
                    label: 'Confirm Passord',
                    controller: _confirmPasswordController,
                    controller2: _passwordController),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      log(_formKey.currentState!.validate().toString());
                      if (_formKey.currentState!.validate()) {
                        log('validated');
                        //adding event to register user
                        log('event added');
                        _registerBloc.add(RegisterButtonPressedEvent(
                            userName: _usernameController.text,
                            password: _passwordController.text));
                      }
                    },
                    child: const Text(
                      'Register',
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
