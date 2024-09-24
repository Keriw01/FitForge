import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/exercises/widgets/equipment_subtitle.dart';
import 'package:fit_forge/pages/workouts/day/cubit/day_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DayAddExercisePage extends StatelessWidget {
  const DayAddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);
    final dayCubit = context.read<DayCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: whiteColor),
          cursorColor: isLight ? defaultFontsColor : whiteColor,
          decoration: InputDecoration(
            hintText: S.of(context).searchExerciseHint,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: whiteColor),
            border: InputBorder.none,
          ),
          onChanged: (query) {
            dayCubit.searchExercises(context, query);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter options
            },
          ),
        ],
      ),
      body: BlocBuilder<DayCubit, DayState>(
        builder: (context, dayState) {
          final exercisesForAdding = dayState.filteredExercisesForAdding ?? [];
          final selectedExercises = dayState.selectedListExercises ?? [];

          return Column(
            children: [
              Expanded(
                child: exercisesForAdding.isNotEmpty
                    ? ListView.builder(
                        itemCount: exercisesForAdding.length,
                        itemBuilder: (context, index) {
                          final exerciseInfo = exercisesForAdding[index];
                          final isSelected =
                              dayCubit.isExerciseSelected(exerciseInfo);

                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                  imageUrl: exerciseInfo.exercise.thumbnailUrl,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const CustomLoadingIndicator(
                                    width: 20,
                                    height: 20,
                                    strokeWidth: 2,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            title: Text(
                              getTranslationText(
                                  exerciseInfo.exercise.title, context),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            subtitle: EquipmentSubtitle(
                              equipment: exerciseInfo.exercise.equipment,
                            ),
                            trailing: Icon(
                              color: isLight ? seedBlue : whiteColor,
                              isSelected ? Icons.circle : Icons.circle_outlined,
                            ),
                            onTap: () {
                              dayCubit.toggleExerciseSelection(exerciseInfo);
                            },
                          );
                        },
                      )
                    : Center(
                        child: Text(
                        S.of(context).emptyExercisesList,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
              ),
              ElevatedButton(
                onPressed: selectedExercises.isNotEmpty
                    ? () => dayCubit.addSelectedExercises()
                    : null,
                child: Text(
                  selectedExercises.length > 1
                      ? '${S.of(context).add} ${selectedExercises.length} ${S.of(context).exercise}'
                      : S.of(context).addExercise,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
