import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_forge/models/exercise_info.dart';
import 'package:fit_forge/pages/exercises/widgets/equipment_subtitle.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class ExercisesItemList extends StatelessWidget {
  final ExerciseInfo exerciseInfo;

  const ExercisesItemList({
    super.key,
    required this.exerciseInfo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(ExerciseDetailRoute(
        exerciseInfo: exerciseInfo,
      )),
      child: ListTile(
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(
          getTranslationText(
            context,
            exerciseInfo.exercise.title,
          ),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: EquipmentSubtitle(
          equipment: exerciseInfo.exercise.equipment,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              fit: BoxFit.fill,
              imageUrl: exerciseInfo.exercise.thumbnailUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CustomLoadingIndicator(
                width: 20,
                height: 20,
                strokeWidth: 2,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
