import 'package:flutter/material.dart';
import 'package:frontendik/modules/sign_in_module/screen.dart';
import 'package:frontendik/modules/sign_up_module/screen.dart';
import 'package:frontendik/modules/welcome_module/widgets/welcome_page_button.dart';
import 'package:frontendik/widgets/page_title.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PageTitle(text: 'Welcome to the Welcome Page'),
            WelcomePageButton(
              onPressed: () => context.push(SignInScreen.path),
              text: 'Sign in',
            ),
            WelcomePageButton(
              onPressed: () => context.push(SignUpScreen.path),
              text: 'Sign up',
            )
          ],
        ),
      ),
    );
  }
}
