import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWorkoutLevelRow extends StatelessWidget {
  final String? currentWorkoutLevel;
  final ProfileCurrenRow profileCurrenRow;

  const CurrentWorkoutLevelRow({
    super.key,
    required this.currentWorkoutLevel,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(context, currentWorkoutLevel, (newWorkoutLevel) {
              context.read<SettingsCubit>().updateUserProfile(
                    ProfileCurrenRow.currentWorkoutLevel,
                    currentWorkoutLevel: newWorkoutLevel,
                  );
            }),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          top: 4,
          bottom: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                S.of(context).currentWorkoutLevelLabel,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Spacer(),
            profileCurrenRow == ProfileCurrenRow.currentWorkoutLevel
                ? const CustomLoadingIndicator(
                    width: 20,
                    height: 20,
                  )
                : Text(
                    currentWorkoutLevel ?? S.of(context).noData,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_ios,
              color: lightGreyColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(
    BuildContext context,
    String? initialValue,
    Function(String) onSave,
  ) async {
    String? tempSelectedOption = initialValue;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                S.of(context).editCurrentWorkoutLevel,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).begginer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: getTranslationWorkoutLevel(
                        context, WorkoutLevel.beginner),
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).intermediate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: getTranslationWorkoutLevel(
                        context, WorkoutLevel.intermediate),
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).advanced,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: getTranslationWorkoutLevel(
                        context, WorkoutLevel.advanced),
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Text(
                        S.of(context).cancel,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        S.of(context).save,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      onPressed: () {
                        if (tempSelectedOption!.isNotEmpty) {
                          onSave(tempSelectedOption!);
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }
}
