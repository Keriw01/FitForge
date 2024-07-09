import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/cubits/auth/auth_cubit.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/auth/widgets/auth_button.dart';
import 'package:fit_forge/pages/auth/widgets/auth_image.dart';
import 'package:fit_forge/pages/auth/widgets/auth_social_buttons.dart';
import 'package:fit_forge/pages/auth/widgets/auth_text_button.dart';
import 'package:fit_forge/pages/auth/widgets/auth_title_page.dart';
import 'package:fit_forge/pages/auth/widgets/email_input_field.dart';
import 'package:fit_forge/pages/auth/widgets/password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AuthTitlePage(title: S.of(context).loginPageTitle),
              const SizedBox(height: 20),
              const AuthImage(assetName: 'assets/images/login_logo.svg'),
              const SizedBox(height: 20),
              const EmailInputField(),
              const PasswordInputField(),
              const SizedBox(height: 10),
              AuthButton(
                onPressed: () => context.read<AuthBloc>().login(),
                text: S.of(context).loginButton,
              ),
              const SizedBox(height: 5),
              AuthTextButton(
                onPressed: () =>
                    context.read<AuthBloc>().navigateToRegisterPage(),
                textNormal: S.of(context).dontHaveAccount,
                textBold: S.of(context).signUp,
              ),
              const AuthSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
