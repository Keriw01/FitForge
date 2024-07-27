import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderRow extends StatefulWidget {
  final String? gender;
  final bool isSavingRow;

  const GenderRow({
    super.key,
    required this.gender,
    required this.isSavingRow,
  });

  @override
  State<GenderRow> createState() => _GenderRowState();
}

class _GenderRowState extends State<GenderRow> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.isSavingRow
          ? null
          : _showEditDialog(context, widget.gender ?? '', (newGender) {
              context.read<SettingsCubit>().updateUserProfile(newGender);
            }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).genderLabel,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                widget.isSavingRow
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        widget.gender ?? S.of(context).noData,
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
              title: Text(S.of(context).editGenderLabel),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Male'),
                    leading: Radio<String>(
                      value: 'Male',
                      groupValue: tempSelectedOption,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedOption = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio<String>(
                      value: 'Female',
                      groupValue: tempSelectedOption,
                      onChanged: (value) {
                        setState(() {
                          tempSelectedOption = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
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
            );
          },
        );
      },
    );
  }
}
