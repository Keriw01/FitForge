import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FormErrorText extends StatelessWidget {
  final String? error;

  const FormErrorText({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return error != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    color: redColor,
                  ),
            ),
          )
        : const SizedBox();
  }
}
