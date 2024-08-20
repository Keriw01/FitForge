import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Abstract base class for Cubits in the project
abstract class BaseCubit<State> extends Cubit<State> {
  final AppRouter _appRouter;

  BaseCubit(this._appRouter, State initialState) : super(initialState);

  @protected
  BuildContext get rootContext => _appRouter.navigatorKey.currentContext!;

  @protected
  AppRouter get appRouter => _appRouter;
}
