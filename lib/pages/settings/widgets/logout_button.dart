import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LogOutButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const LogOutButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, FormzSubmissionStatus>(
      selector: (state) => state.formStatus,
      builder: (context, state) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: state.isInProgress ? () {} : onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(40, 10, 40, 10)),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: state.isInProgress
                  ? const CustomLoadingIndicator(
                      width: 30,
                      height: 30,
                    )
                  : Text(
                      text,
                    ),
            ),
          ],
        );
      },
    );
  }
}
