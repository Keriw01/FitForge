import 'package:fit_forge/generated/l10n.dart';
import 'package:flutter/material.dart';

Future<void> showEditDialog(
  BuildContext context,
  String initialValue,
  Function(String) onSave,
) async {
  TextEditingController controller = TextEditingController(text: initialValue);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).editUsernameLabel),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: S.of(context).enterNewUsername),
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
              onSave(controller.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
