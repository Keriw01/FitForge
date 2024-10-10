import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/pages/progress/widgets/session_item.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocSelector<ProgressCubit, ProgressState, List<Session>?>(
          selector: (state) {
            return state.sessions;
          },
          builder: (context, sessions) {
            if (sessions == null || sessions.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).emptySessions,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    S.of(context).lastActivity,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: sessions.length,
                    itemBuilder: ((context, index) {
                      final session = sessions[index];
                      return SessionItem(session: session);
                    }),
                  ),
                ),
              ],
            );
          },
        ),
        const WorkoutSessionFloating(),
      ],
    );
  }
}
