import 'package:fit_forge/consts/profile_enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ConnectWithGoogleFitRow extends StatelessWidget {
  final bool isConnectWithGoogleFit;
  final ProfileCurrenRow profileCurrenRow;

  const ConnectWithGoogleFitRow({
    super.key,
    required this.isConnectWithGoogleFit,
    required this.profileCurrenRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).connectWithGoogleFit,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            width: 90,
            height: 30,
            child: TextButton(
              onPressed: () {
                // TODO obsłużyć połączenie z Google FIT
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(greenButton)),
              child: Text(
                S.of(context).connect,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
