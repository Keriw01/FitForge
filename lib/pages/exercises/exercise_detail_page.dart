import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/models/plan.dart';
import 'package:fit_forge/models/plan_day.dart';
import 'package:fit_forge/pages/exercises/widgets/available_equipment_list.dart';
import 'package:fit_forge/pages/exercises/widgets/target_muscle_group_list.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/exercise_helpers.dart';
import 'package:fit_forge/utils/helpers/translation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class ExerciseDetailPage extends StatefulWidget {
  final ExerciseInfo exerciseInfo;

  const ExerciseDetailPage({
    super.key,
    required this.exerciseInfo,
  });

  @override
  _ExerciseDetailPageState createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.exerciseInfo.exercise.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  void _showAddToPlanModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return BlocBuilder<WorkoutsCubit, WorkoutsState>(
          builder: (context, state) {
            final userPlans = state.userPlans;
            if (userPlans == null || userPlans.isEmpty) {
              return Center(
                child: Text(S.of(context).noPlansAvailable),
              );
            }

            Plan? selectedPlan;
            PlanDay? selectedDay;

            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                    bottom: 70,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => context.router.maybePop(),
                              child: Text(S.of(context).cancel),
                            ),
                            Text(S.of(context).addExercise),
                            TextButton(
                              onPressed:
                                  selectedPlan != null && selectedDay != null
                                      ? () {
                                          context
                                              .read<WorkoutsCubit>()
                                              .addNewExercise(
                                                selectedPlan?.planId,
                                                selectedDay,
                                                widget.exerciseInfo,
                                              );
                                          Navigator.of(context).pop();
                                        }
                                      : null,
                              child: Text(S.of(context).add),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(S.of(context).whichPlan),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<Plan>(
                            alignment: Alignment.center,
                            isExpanded: true,
                            hint: Text(S.of(context).planName),
                            value: selectedPlan,
                            items: userPlans.map((plan) {
                              return DropdownMenuItem<Plan>(
                                alignment: Alignment.center,
                                value: plan,
                                child: Text(plan.planName),
                              );
                            }).toList(),
                            onChanged: (Plan? newPlan) {
                              setState(() {
                                selectedPlan = newPlan;
                                selectedDay = null;
                              });
                            },
                            dropdownStyleData: const DropdownStyleData(
                              isOverButton: true,
                              maxHeight: 100,
                            ),
                          ),
                        ),
                        if (selectedPlan != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(S.of(context).whichDay),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<PlanDay>(
                                  alignment: Alignment.center,
                                  isExpanded: true,
                                  hint: Text(S.of(context).whichDay),
                                  value: selectedDay,
                                  items: selectedPlan!.days!
                                      .where((day) => !(day.dayExercises ?? [])
                                          .any((exercise) =>
                                              exercise.exerciseRefId ==
                                              widget.exerciseInfo.exerciseId))
                                      .map((day) {
                                    return DropdownMenuItem<PlanDay>(
                                      alignment: Alignment.center,
                                      value: day,
                                      child: Text(day.dayTitle),
                                    );
                                  }).toList(),
                                  onChanged: (PlanDay? newDay) {
                                    setState(() {
                                      selectedDay = newDay;
                                    });
                                  },
                                  dropdownStyleData: const DropdownStyleData(
                                    isOverButton: true,
                                    maxHeight: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).exerciseDetailPageTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10, right: 10, bottom: 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        getTranslationText(
                            widget.exerciseInfo.exercise.title, context),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    YoutubePlayer(
                      controller: _controller,
                      bottomActions: const [
                        CurrentPosition(),
                        SizedBox(width: 10),
                        ProgressBar(isExpanded: true),
                        SizedBox(width: 10),
                        RemainingDuration(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).targetMuscleGroup,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        TargetMuscleGroupList(
                          targetMuscleGroupList: convertMapToList(
                              widget.exerciseInfo.exercise.otherBodyParts,
                              context),
                          mainBodyPart: getTranslationText(
                              widget.exerciseInfo.exercise.mainBodyPart,
                              context),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).availableEquipment,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        AvailableEquipmentList(
                            availableEquipmentList: convertMapToList(
                                widget.exerciseInfo.exercise.equipment,
                                context)),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).description,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          getTranslationText(
                              widget.exerciseInfo.exercise.description,
                              context),
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _showAddToPlanModal(context),
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(midNightBlue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      S.of(context).addExerciseToYourPlan,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.router.popUntilRoot(),
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(darkBlue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      S.of(context).exit,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
