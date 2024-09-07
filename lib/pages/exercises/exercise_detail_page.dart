import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/exercise.dart';
import 'package:fit_forge/pages/exercises/widgets/available_equipment_list.dart';
import 'package:fit_forge/pages/exercises/widgets/target_muscle_group_list.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/exercise_helpers.dart';
import 'package:fit_forge/utils/helpers/translation_helpers.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class ExerciseDetailPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseDetailPage({
    super.key,
    required this.exercise,
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
      initialVideoId: YoutubePlayer.convertUrlToId(widget.exercise.videoUrl)!,
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
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10, right: 10, bottom: 110),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      getTranslationText(widget.exercise.title, context),
                      style: Theme.of(context).textTheme.headlineLarge,
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
                              widget.exercise.otherBodyParts, context),
                          mainBodyPart: getTranslationText(
                              widget.exercise.mainBodyPart, context),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).availableEquipment,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        AvailableEquipmentList(
                            availableEquipmentList: convertMapToList(
                                widget.exercise.equipment, context)),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).description,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          getTranslationText(
                              widget.exercise.description, context),
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
                  onPressed: () {},
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
