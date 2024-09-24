import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String textNormal;
  final String textBold;
  final void Function() onPressed;

  const AuthTextButton({
    super.key,
    required this.textNormal,
    required this.textBold,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textNormal,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              textBold,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
