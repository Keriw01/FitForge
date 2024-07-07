import 'package:fit_forge/blocs/auth/bloc/auth_bloc.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/styles/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(_appRouter, context),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Fit Forge',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
      ),
    );
  }
}
