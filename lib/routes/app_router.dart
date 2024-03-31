import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/pages/authentication_flow_screen.dart';
import 'package:fit_forge/pages/home/home_page.dart';
import 'package:fit_forge/pages/auth/login/login_page.dart';
import 'package:fit_forge/pages/auth/register/register_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthenticationFlowRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
