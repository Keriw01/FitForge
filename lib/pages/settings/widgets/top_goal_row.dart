import 'package:fit_forge/consts/profile_enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopGoalRow extends StatelessWidget {
  final String? topGoal;
  final ProfileCurrenRow profileCurrenRow;

  const TopGoalRow({
    super.key,
    required this.topGoal,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(context, topGoal ?? '', (newTopGoal) {
              context.read<SettingsCubit>().updateUserProfile(
                    ProfileCurrenRow.topGoal,
                    topGoal: newTopGoal,
                  );
            }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).topGoalLabel,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                profileCurrenRow == ProfileCurrenRow.topGoal
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        topGoal ?? S.of(context).noData,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: lightGreyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(
    BuildContext context,
    String initialValue,
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
                S.of(context).editTopGoal,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).maintaining,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      S.of(context).maintainingDescription,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    value: 'Maintaining',
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).bulking,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      S.of(context).bulkingDescription,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    value: 'Bulking',
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).cutting,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      S.of(context).cuttingDescription,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    value: 'Cutting',
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
                      child: Text(S.of(context).cancel),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(S.of(context).save),
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
