import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitSystemRow extends StatelessWidget {
  final String? unitSystem;
  final ProfileCurrenRow profileCurrenRow;

  const UnitSystemRow({
    super.key,
    required this.unitSystem,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(context, unitSystem ?? '', (newUnitSystem) {
              context.read<SettingsCubit>().updateUserProfile(
                    ProfileCurrenRow.unitSystem,
                    unitSystem: newUnitSystem,
                  );
            }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).unitSystem,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                profileCurrenRow == ProfileCurrenRow.unitSystem
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        unitSystem ?? S.of(context).noData,
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
                S.of(context).editUnitSystem,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: Text(
                      'cm/kg',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'cm/kg',
                    groupValue: tempSelectedOption,
                    onChanged: (value) {
                      setState(() {
                        tempSelectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'inch/lb',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'inch/lb',
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
