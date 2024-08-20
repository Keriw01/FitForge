import 'package:flutter/material.dart';

class CurrentPlanView extends StatelessWidget {
  const CurrentPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Not set current plan'),
        ],
      ),
    );
  }
}
