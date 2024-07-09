import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/blocs/auth/bloc/auth_bloc.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final currentUser = state.currentUser;
          return Center(
            child: Column(
              children: [
                if (currentUser != null) Text('Welcome, ${currentUser.email}'),
                ElevatedButton(
                    child: Text(S.of(context).signUp),
                    onPressed: () => context.read<AuthBloc>().logOut()),
              ],
            ),
          );
        },
      ),
    );
  }
}
