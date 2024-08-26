import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTitlePage extends StatelessWidget {
  final String title;

  const AuthTitlePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: isLight ? defaultFontsColor : whiteColor),
    );
  }
}
