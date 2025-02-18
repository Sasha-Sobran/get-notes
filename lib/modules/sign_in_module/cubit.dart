import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/api/auth_api.dart';
import 'package:frontendik/cubit/auth/auth_cubit.dart';
import 'package:frontendik/modules/home_module/screen.dart';
import 'package:go_router/go_router.dart';

class SignInState {
  final bool isLoading;

  final formKey = GlobalKey<FormState>();

  SignInState({this.isLoading = false});

  SignInState copyWith({bool? isLoading}) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    final isValid = validateForm();
    if (!isValid) {
      return;
    }

    final token =
        await AuthApi.signIn(loginController.text, passwordController.text);

    if (context.mounted) {
      context.read<AuthCubit>().saveUserToken(token);
      context.go(Home.path);
    }
  }

  bool validateForm() {
    return state.formKey.currentState!.validate();
  }
}
