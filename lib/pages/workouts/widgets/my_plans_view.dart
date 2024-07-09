import 'package:flutter/material.dart';

class MyPlansView extends StatelessWidget {
  const MyPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Empty plans'),
        ],
      ),
    );
  }
}
