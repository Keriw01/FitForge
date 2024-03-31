import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 70,
              color: midNightBlue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                S.of(context).or,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Container(
              height: 1,
              width: 70,
              color: midNightBlue,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.google,
                color: seedBlue,
              ),
              splashRadius: 0.1,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.facebook,
                color: seedBlue,
              ),
              splashRadius: 0.1,
            ),
          ],
        ),
      ],
    );
  }
}
