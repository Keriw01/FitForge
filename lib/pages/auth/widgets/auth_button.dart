import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
import 'package:fit_forge/pages/auth/widgets/auth_input_error.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tuple/tuple.dart';

class AuthButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const AuthButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState,
        Tuple2<FormzSubmissionStatus, AuthResponseMessage>>(
      selector: (state) => Tuple2(state.formStatus, state.authResponseMessage),
      builder: (context, state) {
        String? responseError =
            context.read<AuthCubit>().getResponseError(state.item2, context);

        return Column(
          children: [
            ElevatedButton(
              onPressed: state.item1.isInProgress ? () {} : onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(40, 10, 40, 10)),
                backgroundColor: MaterialStateProperty.all(seedBlue),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: state.item1.isInProgress
                  ? const CustomLoadingIndicator(
                      width: 30,
                      height: 30,
                    )
                  : Text(
                      text,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
            ),
            FormErrorText(error: responseError),
          ],
        );
      },
    );
  }
}
