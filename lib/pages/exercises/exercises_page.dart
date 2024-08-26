import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/pages/exercises/widgets/exercises_item_list.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExercisesPage extends StatelessWidget {
  final String bodyPart;
  const ExercisesPage({
    super.key,
    required this.bodyPart,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ExercisesCubit>().filteringExercises(bodyPart);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).exercisesPageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<ExercisesCubit, ExercisesState>(
        builder: (context, state) {
          if (state.isFiltering) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }

          final filteredExercises = state.filteredExercises;

          if (filteredExercises == null || filteredExercises.isEmpty) {
            return const Center(child: Text('No exercises found.'));
          }

          return ListView.builder(
            itemCount: filteredExercises.length,
            itemBuilder: (context, index) {
              final exercises = filteredExercises[index];
              return ExercisesItemList(exercise: exercises.exercise);
            },
          );
        },
      ),
    );
  }
}
