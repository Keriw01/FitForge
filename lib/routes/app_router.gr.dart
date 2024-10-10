// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivityDetailPage(
          key: args.key,
          session: args.session,
          exercises: args.exercises,
        ),
      );
    },
    AuthenticationFlowRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationFlowScreen(),
      );
    },
    BodyPartsRoute.name: (routeData) {
      final args = routeData.argsAs<BodyPartsRouteArgs>(
          orElse: () => const BodyPartsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BodyPartsPage(key: args.key),
      );
    },
    DayAddExerciseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DayAddExercisePage(),
      );
    },
    DayRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DayPage(),
      );
    },
    ExerciseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseDetailPage(
          key: args.key,
          exerciseInfo: args.exerciseInfo,
        ),
      );
    },
    ExerciseSessionRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseSessionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseSessionPage(
          key: args.key,
          exercise: args.exercise,
          dayExercise: args.dayExercise,
        ),
      );
    },
    ExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<ExercisesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExercisesPage(
          key: args.key,
          bodyPart: args.bodyPart,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainPage(key: args.key),
      );
    },
    ProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgressPage(),
      );
    },
    QrCodeRoute.name: (routeData) {
      final args = routeData.argsAs<QrCodeRouteArgs>(
          orElse: () => const QrCodeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QrCodePage(key: args.key),
      );
    },
    QrScanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QrScanPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(key: args.key),
      );
    },
    WorkoutSummarySessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkoutSummarySessionPage(),
      );
    },
    WorkoutsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkoutsPage(),
      );
    },
  };
}

/// generated route for
/// [ActivityDetailPage]
class ActivityDetailRoute extends PageRouteInfo<ActivityDetailRouteArgs> {
  ActivityDetailRoute({
    Key? key,
    required Session session,
    required List<ExerciseInfo> exercises,
    List<PageRouteInfo>? children,
  }) : super(
          ActivityDetailRoute.name,
          args: ActivityDetailRouteArgs(
            key: key,
            session: session,
            exercises: exercises,
          ),
          initialChildren: children,
        );

  static const String name = 'ActivityDetailRoute';

  static const PageInfo<ActivityDetailRouteArgs> page =
      PageInfo<ActivityDetailRouteArgs>(name);
}

class ActivityDetailRouteArgs {
  const ActivityDetailRouteArgs({
    this.key,
    required this.session,
    required this.exercises,
  });

  final Key? key;

  final Session session;

  final List<ExerciseInfo> exercises;

  @override
  String toString() {
    return 'ActivityDetailRouteArgs{key: $key, session: $session, exercises: $exercises}';
  }
}

/// generated route for
/// [AuthenticationFlowScreen]
class AuthenticationFlowRoute extends PageRouteInfo<void> {
  const AuthenticationFlowRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationFlowRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BodyPartsPage]
class BodyPartsRoute extends PageRouteInfo<BodyPartsRouteArgs> {
  BodyPartsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BodyPartsRoute.name,
          args: BodyPartsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BodyPartsRoute';

  static const PageInfo<BodyPartsRouteArgs> page =
      PageInfo<BodyPartsRouteArgs>(name);
}

class BodyPartsRouteArgs {
  const BodyPartsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BodyPartsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DayAddExercisePage]
class DayAddExerciseRoute extends PageRouteInfo<void> {
  const DayAddExerciseRoute({List<PageRouteInfo>? children})
      : super(
          DayAddExerciseRoute.name,
          initialChildren: children,
        );

  static const String name = 'DayAddExerciseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DayPage]
class DayRoute extends PageRouteInfo<void> {
  const DayRoute({List<PageRouteInfo>? children})
      : super(
          DayRoute.name,
          initialChildren: children,
        );

  static const String name = 'DayRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExerciseDetailPage]
class ExerciseDetailRoute extends PageRouteInfo<ExerciseDetailRouteArgs> {
  ExerciseDetailRoute({
    Key? key,
    required ExerciseInfo exerciseInfo,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseDetailRoute.name,
          args: ExerciseDetailRouteArgs(
            key: key,
            exerciseInfo: exerciseInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseDetailRoute';

  static const PageInfo<ExerciseDetailRouteArgs> page =
      PageInfo<ExerciseDetailRouteArgs>(name);
}

class ExerciseDetailRouteArgs {
  const ExerciseDetailRouteArgs({
    this.key,
    required this.exerciseInfo,
  });

  final Key? key;

  final ExerciseInfo exerciseInfo;

  @override
  String toString() {
    return 'ExerciseDetailRouteArgs{key: $key, exerciseInfo: $exerciseInfo}';
  }
}

/// generated route for
/// [ExerciseSessionPage]
class ExerciseSessionRoute extends PageRouteInfo<ExerciseSessionRouteArgs> {
  ExerciseSessionRoute({
    Key? key,
    required Exercise exercise,
    required DayExercise dayExercise,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseSessionRoute.name,
          args: ExerciseSessionRouteArgs(
            key: key,
            exercise: exercise,
            dayExercise: dayExercise,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseSessionRoute';

  static const PageInfo<ExerciseSessionRouteArgs> page =
      PageInfo<ExerciseSessionRouteArgs>(name);
}

class ExerciseSessionRouteArgs {
  const ExerciseSessionRouteArgs({
    this.key,
    required this.exercise,
    required this.dayExercise,
  });

  final Key? key;

  final Exercise exercise;

  final DayExercise dayExercise;

  @override
  String toString() {
    return 'ExerciseSessionRouteArgs{key: $key, exercise: $exercise, dayExercise: $dayExercise}';
  }
}

/// generated route for
/// [ExercisesPage]
class ExercisesRoute extends PageRouteInfo<ExercisesRouteArgs> {
  ExercisesRoute({
    Key? key,
    required String bodyPart,
    List<PageRouteInfo>? children,
  }) : super(
          ExercisesRoute.name,
          args: ExercisesRouteArgs(
            key: key,
            bodyPart: bodyPart,
          ),
          initialChildren: children,
        );

  static const String name = 'ExercisesRoute';

  static const PageInfo<ExercisesRouteArgs> page =
      PageInfo<ExercisesRouteArgs>(name);
}

class ExercisesRouteArgs {
  const ExercisesRouteArgs({
    this.key,
    required this.bodyPart,
  });

  final Key? key;

  final String bodyPart;

  @override
  String toString() {
    return 'ExercisesRouteArgs{key: $key, bodyPart: $bodyPart}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProgressPage]
class ProgressRoute extends PageRouteInfo<void> {
  const ProgressRoute({List<PageRouteInfo>? children})
      : super(
          ProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QrCodePage]
class QrCodeRoute extends PageRouteInfo<QrCodeRouteArgs> {
  QrCodeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QrCodeRoute.name,
          args: QrCodeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'QrCodeRoute';

  static const PageInfo<QrCodeRouteArgs> page = PageInfo<QrCodeRouteArgs>(name);
}

class QrCodeRouteArgs {
  const QrCodeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'QrCodeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [QrScanPage]
class QrScanRoute extends PageRouteInfo<void> {
  const QrScanRoute({List<PageRouteInfo>? children})
      : super(
          QrScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<SettingsRouteArgs> page =
      PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [WorkoutSummarySessionPage]
class WorkoutSummarySessionRoute extends PageRouteInfo<void> {
  const WorkoutSummarySessionRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutSummarySessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutSummarySessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkoutsPage]
class WorkoutsRoute extends PageRouteInfo<void> {
  const WorkoutsRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
