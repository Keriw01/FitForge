import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/blocs/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QrCodeInitialPage extends StatelessWidget {
  QrCodeInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("QrCodeInitialPage"),
    );
  }
}
