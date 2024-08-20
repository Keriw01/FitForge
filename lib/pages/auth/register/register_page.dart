import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
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
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AuthTitlePage(title: S.of(context).registerPageTitle),
              const SizedBox(height: 20),
              const AuthImage(assetName: 'assets/images/register_logo.svg'),
              const SizedBox(height: 20),
              const EmailInputField(),
              const PasswordInputField(),
              const SizedBox(height: 10),
              AuthButton(
                onPressed: () => context.read<AuthCubit>().register(),
                text: S.of(context).signUpButton,
              ),
              const SizedBox(height: 5),
              AuthTextButton(
                onPressed: () =>
                    context.read<AuthCubit>().navigateToLoginPage(),
                textNormal: S.of(context).alreadyHaveAccount,
                textBold: S.of(context).signIn,
              ),
              const AuthSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
