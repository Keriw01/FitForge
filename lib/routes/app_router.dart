import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/pages/authentication_flow_screen.dart';
import 'package:fit_forge/pages/exercises/body_parts_page.dart';
import 'package:fit_forge/pages/exercises/exercise_detail_page.dart';
import 'package:fit_forge/pages/exercises/exercises_page.dart';
import 'package:fit_forge/pages/home/main_page.dart';
import 'package:fit_forge/pages/auth/login/login_page.dart';
import 'package:fit_forge/pages/auth/register/register_page.dart';
import 'package:fit_forge/pages/scan_qr_code/qr_scan_page.dart';
import 'package:fit_forge/pages/workouts/workouts_page.dart';
import 'package:fit_forge/pages/scan_qr_code/qr_code_page.dart';
import 'package:fit_forge/pages/settings/settings_page.dart';
import 'package:fit_forge/pages/statistics/history_page.dart';
import 'package:fit_forge/pages/statistics/statistics_page.dart';
import 'package:fit_forge/pages/statistics/insights_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthenticationFlowRoute.page,
          initial: true,
          children: [
            AutoRoute(page: MainRoute.page),
            AutoRoute(page: QrCodeRoute.page),
            AutoRoute(page: WorkoutsRoute.page),
            AutoRoute(page: BodyPartsRoute.page),
            AutoRoute(page: StatisticsRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ExercisesRoute.page),
        AutoRoute(page: ExerciseDetailRoute.page),
        AutoRoute(page: QrScanRoute.page),
      ];
}
