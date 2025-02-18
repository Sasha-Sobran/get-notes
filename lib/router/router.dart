import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:frontendik/cubit/auth/auth_cubit.dart';
import 'package:frontendik/modules/home_module/screen.dart';
import 'package:frontendik/modules/sign_up_module/screen.dart';
import 'package:frontendik/modules/welcome_module/screen.dart';
import 'package:frontendik/modules/sign_in_module/screen.dart';

class AppRouter {
  final goRouter = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final noAuthRequiredRoutes = [
        SignInScreen.path,
        SignUpScreen.path,
      ].contains(state.matchedLocation);

      final cubit = context.read<AuthCubit>();
      if (!noAuthRequiredRoutes) {
        if (cubit.state.token.isNotEmpty) {
          return '/home';
        } else {
          return '/';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: WelcomePage(),
        ),
      ),
      GoRoute(
        path: SignInScreen.path,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: SignUpScreen.path,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: Home.path,
        pageBuilder: (context, state) => const MaterialPage(
          child: Home(),
        ),
      ),
    ],
  );
}
