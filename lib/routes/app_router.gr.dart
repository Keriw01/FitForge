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
    ExerciseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseDetailPage(
          key: args.key,
          exercise: args.exercise,
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
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>(
          orElse: () => const HistoryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HistoryPage(key: args.key),
      );
    },
    InsightsRoute.name: (routeData) {
      final args = routeData.argsAs<InsightsRouteArgs>(
          orElse: () => const InsightsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InsightsPage(key: args.key),
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
    QrCodeInitialRoute.name: (routeData) {
      final args = routeData.argsAs<QrCodeInitialRouteArgs>(
          orElse: () => const QrCodeInitialRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QrCodeInitialPage(key: args.key),
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
    StatisticsRoute.name: (routeData) {
      final args = routeData.argsAs<StatisticsRouteArgs>(
          orElse: () => const StatisticsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StatisticsPage(key: args.key),
      );
    },
    WorkoutsRoute.name: (routeData) {
      final args = routeData.argsAs<WorkoutsRouteArgs>(
          orElse: () => const WorkoutsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WorkoutsPage(key: args.key),
      );
    },
  };
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
/// [ExerciseDetailPage]
class ExerciseDetailRoute extends PageRouteInfo<ExerciseDetailRouteArgs> {
  ExerciseDetailRoute({
    Key? key,
    required Exercise exercise,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseDetailRoute.name,
          args: ExerciseDetailRouteArgs(
            key: key,
            exercise: exercise,
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
    required this.exercise,
  });

  final Key? key;

  final Exercise exercise;

  @override
  String toString() {
    return 'ExerciseDetailRouteArgs{key: $key, exercise: $exercise}';
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
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HistoryRoute.name,
          args: HistoryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<HistoryRouteArgs> page =
      PageInfo<HistoryRouteArgs>(name);
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [InsightsPage]
class InsightsRoute extends PageRouteInfo<InsightsRouteArgs> {
  InsightsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          InsightsRoute.name,
          args: InsightsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'InsightsRoute';

  static const PageInfo<InsightsRouteArgs> page =
      PageInfo<InsightsRouteArgs>(name);
}

class InsightsRouteArgs {
  const InsightsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'InsightsRouteArgs{key: $key}';
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
/// [QrCodeInitialPage]
class QrCodeInitialRoute extends PageRouteInfo<QrCodeInitialRouteArgs> {
  QrCodeInitialRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QrCodeInitialRoute.name,
          args: QrCodeInitialRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'QrCodeInitialRoute';

  static const PageInfo<QrCodeInitialRouteArgs> page =
      PageInfo<QrCodeInitialRouteArgs>(name);
}

class QrCodeInitialRouteArgs {
  const QrCodeInitialRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'QrCodeInitialRouteArgs{key: $key}';
  }
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
/// [StatisticsPage]
class StatisticsRoute extends PageRouteInfo<StatisticsRouteArgs> {
  StatisticsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StatisticsRoute.name,
          args: StatisticsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const PageInfo<StatisticsRouteArgs> page =
      PageInfo<StatisticsRouteArgs>(name);
}

class StatisticsRouteArgs {
  const StatisticsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'StatisticsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [WorkoutsPage]
class WorkoutsRoute extends PageRouteInfo<WorkoutsRouteArgs> {
  WorkoutsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WorkoutsRoute.name,
          args: WorkoutsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WorkoutsRoute';

  static const PageInfo<WorkoutsRouteArgs> page =
      PageInfo<WorkoutsRouteArgs>(name);
}

class WorkoutsRouteArgs {
  const WorkoutsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'WorkoutsRouteArgs{key: $key}';
  }
}
