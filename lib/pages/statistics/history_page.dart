import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HistoryPage"),
    );
  }
}
