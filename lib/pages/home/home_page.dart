import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/blocs/auth/bloc/auth_bloc.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            child: Text("LogOut"),
            onPressed: () => context.read<AuthBloc>().logOut()),
      ),
    );
  }
}
