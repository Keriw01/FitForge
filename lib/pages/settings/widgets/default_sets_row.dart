import 'package:fit_forge/consts/profile_enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultSetsRow extends StatelessWidget {
  final String defaultSets;
  final ProfileCurrenRow profileCurrenRow;

  const DefaultSetsRow({
    super.key,
    required this.defaultSets,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(
              context,
              defaultSets,
              (newDefaultSets) =>
                  context.read<SettingsCubit>().updateUserProfile(
                        ProfileCurrenRow.defaultSets,
                        defaultSets: newDefaultSets,
                      ),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).defaultsSets,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                profileCurrenRow == ProfileCurrenRow.defaultSets
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        defaultSets,
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
}

Future<void> _showEditDialog(
  BuildContext context,
  String initialValue,
  Function(int) onSave,
) async {
  TextEditingController controller = TextEditingController(text: initialValue);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          S.of(context).editDefaultSets,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
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
                  onSave(int.tryParse(controller.text)!);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
