import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/api/auth_api.dart';
import 'package:frontendik/cubit/auth/auth_cubit.dart';
import 'package:frontendik/modules/home_module/screen.dart';
import 'package:go_router/go_router.dart';

class SignUpState {
  final bool isLoading;

  final formKey = GlobalKey<FormState>();

  SignUpState({this.isLoading = false});

  SignUpState copyWith({bool? isLoading}) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final loginController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    final isValid = validateForm();
    if (!isValid) {
      return;
    }

    final user = await AuthApi.signUp(
      nameController.text,
      surnameController.text,
      loginController.text,
      emailController.text,
      passwordController.text,
    );

    final token = await AuthApi.signIn(user.login, passwordController.text);

    if (context.mounted) {
      context.read<AuthCubit>().saveUserToken(token);
      context.go(Home.path);
    }
  }

  bool validateForm() {
    return state.formKey.currentState!.validate();
  }
}
