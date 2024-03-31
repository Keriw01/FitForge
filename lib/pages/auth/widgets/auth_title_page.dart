import 'package:flutter/material.dart';

class AuthTitlePage extends StatelessWidget {
  final String title;
  const AuthTitlePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
