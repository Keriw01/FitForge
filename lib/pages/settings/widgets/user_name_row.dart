import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameRow extends StatelessWidget {
  final String? userName;
  final ProfileCurrenRow profileCurrenRow;

  const UserNameRow({
    super.key,
    required this.userName,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => profileCurrenRow != ProfileCurrenRow.none
          ? null
          : _showEditDialog(
              context,
              userName ?? '',
              (newName) => context.read<SettingsCubit>().updateUserProfile(
                    ProfileCurrenRow.userName,
                    userName: newName,
                  ),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).usernameLabel,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              children: [
                profileCurrenRow == ProfileCurrenRow.userName
                    ? const CustomLoadingIndicator(
                        width: 20,
                        height: 20,
                      )
                    : Text(
                        userName ?? S.of(context).noData,
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
}

Future<void> _showEditDialog(
  BuildContext context,
  String initialValue,
  Function(String) onSave,
) async {
  TextEditingController controller = TextEditingController(text: initialValue);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          S.of(context).editUsernameLabel,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: S.of(context).enterNewUsername,
            hintStyle: Theme.of(context).textTheme.labelMedium,
          ),
          style: Theme.of(context).textTheme.labelMedium,
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
                  onSave(controller.text);
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
