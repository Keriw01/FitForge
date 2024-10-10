import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/models/day_exercise.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/authentication_flow_screen.dart';
import 'package:fit_forge/pages/exercises/body_parts_page.dart';
import 'package:fit_forge/pages/exercises/exercise_detail_page.dart';
import 'package:fit_forge/pages/exercises/exercises_page.dart';
import 'package:fit_forge/pages/home/main_page.dart';
import 'package:fit_forge/pages/auth/login/login_page.dart';
import 'package:fit_forge/pages/auth/register/register_page.dart';
import 'package:fit_forge/pages/progress/widgets/activity_detail_page.dart';
import 'package:fit_forge/pages/scan_qr_code/qr_scan_page.dart';
import 'package:fit_forge/pages/workouts/day/day_add_exercise_page.dart';
import 'package:fit_forge/pages/workouts/day/day_page.dart';
import 'package:fit_forge/pages/workouts/session/exercise_session_page.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_summary_session_page.dart';
import 'package:fit_forge/pages/workouts/workouts_page.dart';
import 'package:fit_forge/pages/scan_qr_code/qr_code_page.dart';
import 'package:fit_forge/pages/settings/settings_page.dart';
import 'package:fit_forge/pages/progress/progress_page.dart';
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
            AutoRoute(page: ProgressRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ExercisesRoute.page),
        AutoRoute(page: ExerciseDetailRoute.page),
        AutoRoute(page: QrScanRoute.page),
        AutoRoute(page: DayRoute.page),
        AutoRoute(page: DayAddExerciseRoute.page),
        AutoRoute(page: ExerciseSessionRoute.page),
        AutoRoute(page: WorkoutSummarySessionRoute.page),
        AutoRoute(page: ActivityDetailRoute.page),
      ];
}
