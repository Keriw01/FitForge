import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderRow extends StatelessWidget {
  final String? gender;
  final ProfileCurrenRow profileCurrenRow;

  const GenderRow({
    super.key,
    required this.gender,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(context, gender ?? '', (newGender) {
              context.read<SettingsCubit>().updateUserProfile(
                    ProfileCurrenRow.gender,
                    gender: newGender,
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
            Text(
              S.of(context).genderLabel,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              children: [
                profileCurrenRow == ProfileCurrenRow.gender
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        gender ?? S.of(context).noData,
                        style: Theme.of(context).textTheme.displaySmall,
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
                S.of(context).editGenderLabel,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).male,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: getTranslationGender(context, Gender.male),
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      S.of(context).female,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: getTranslationGender(context, Gender.female),
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
