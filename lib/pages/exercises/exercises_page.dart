import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/pages/exercises/widgets/body_part_item.dart';
import 'package:fit_forge/utils/get_response_error.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExercisesPage extends StatelessWidget {
  ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        S.of(context).exercisesPartsPageTitle,
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: BlocConsumer<ExercisesCubit, ExercisesState>(
        listener: (context, state) {
          if (state.firestoreResponseMessage != FirestoreResponseMessage.none) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getResponseError(state.firestoreResponseMessage, context)!,
                ),
              ),
            );
          }
        },
        builder: (BuildContext context, ExercisesState state) {
          if (state.isLoading) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }

          final size = MediaQuery.of(context).size;
          final screenWidth = size.width;
          final screenHeight = size.height;

          const bottomNavBarHeight = 84;

          const crossAxisCount = 3;

          final itemWidth = screenWidth / crossAxisCount;
          final itemHeight =
              (screenHeight - kToolbarHeight - bottomNavBarHeight) /
                  (12 / crossAxisCount);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: itemWidth / itemHeight,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return BodyPartItem(
                title: getTitleForIndex(index, context),
                imageAsset: getImageAssetForIndex(index),
                onTap: () {
                  // TODO onTap getFilter(getbodyPart(index))
                },
              );
            },
          );
        },
      ),
    );
  }

  String getTitleForIndex(int index, BuildContext context) {
    List<String> titles = [
      S.of(context).chest,
      S.of(context).back,
      S.of(context).shoulders,
      S.of(context).triceps,
      S.of(context).biceps,
      S.of(context).forearms,
      S.of(context).upperLegs,
      S.of(context).lowerLegs,
      S.of(context).glutes,
      S.of(context).core,
      S.of(context).cardio,
      S.of(context).showAll,
    ];

    return titles[index % titles.length];
  }

  String getImageAssetForIndex(int index) {
    List<String> imageAsset = [
      'assets/images/body_parts/chest.png',
      'assets/images/body_parts/back.png',
      'assets/images/body_parts/shoulders.png',
      'assets/images/body_parts/triceps.png',
      'assets/images/body_parts/biceps.png',
      'assets/images/body_parts/forearms.png',
      'assets/images/body_parts/upper_legs.png',
      'assets/images/body_parts/lower_legs.png',
      'assets/images/body_parts/glutes.png',
      'assets/images/body_parts/core.png',
      'assets/images/body_parts/cardio.png',
      'assets/images/body_parts/show_all.png',
    ];

    return imageAsset[index % imageAsset.length];
  }
}
