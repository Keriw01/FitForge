import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/auth/widgets/auth_input_error.dart';
import 'package:fit_forge/pages/auth/widgets/underline_input_border.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tuple/tuple.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState,
        Tuple2<FormzSubmissionStatus, PasswordInput>>(
      selector: (state) => Tuple2(
        state.formStatus,
        state.password,
      ),
      builder: (context, state) {
        String? errorInputText = state.item2.isNotValid &&
                state.item2.error != null &&
                state.item1.isFailure
            ? state.item2.error is EmptyTextError
                ? S.of(context).inputEmpty
                : state.item2.error is ShortPassword
                    ? S.of(context).shortPassword
                    : null
            : null;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
              child: TextFormField(
                onChanged: (value) =>
                    context.read<AuthCubit>().passwordChanged(value),
                readOnly: state.item1.isInProgress,
                cursorColor: seedBlue,
                style: const TextStyle(
                  fontSize: 14,
                  color: defaultFontsColor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  errorBorder: underlineInputBorder,
                  focusedErrorBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  enabledBorder: underlineInputBorder,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: seedBlue,
                    size: 18,
                  ),
                  labelText: S.of(context).enterPassword,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    color: defaultFontsColor,
                  ),
                  floatingLabelStyle: const TextStyle(
                    fontSize: 12,
                    color: defaultFontsColor,
                  ),
                ),
                obscureText: true,
              ),
            ),
            FormErrorText(error: errorInputText),
          ],
        );
      },
    );
  }
}
