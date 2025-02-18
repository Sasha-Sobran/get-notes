import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendik/modules/sign_up_module/cubit.dart';
import 'package:frontendik/widgets/page_title.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  static const String path = '/sign-up';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();

          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: context.pop,
                child: const Icon(Icons.arrow_back),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PageTitle(text: 'Welcome to the Sign Up Page'),
                  Form(
                    key: state.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: cubit.nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cubit.surnameController,
                          decoration:
                              const InputDecoration(labelText: 'Surname'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Surname';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cubit.loginController,
                          decoration: const InputDecoration(labelText: 'Login'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your login';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cubit.emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: cubit.passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () => cubit.signUp(context),
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
