import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: Text("StatisticsPage")),
      const WorkoutSessionFloating(),
    ]);
  }
}
