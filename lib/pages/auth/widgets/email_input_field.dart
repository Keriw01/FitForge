import 'package:fit_forge/blocs/auth/bloc/auth_bloc.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/auth/widgets/auth_input_error.dart';
import 'package:fit_forge/pages/auth/widgets/underline_input_border.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/forms/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tuple/tuple.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState,
        Tuple2<FormzSubmissionStatus, EmailInput>>(
      selector: (state) => Tuple2(
        state.formStatus,
        state.email,
      ),
      builder: (context, state) {
        String? errorInputText = state.item2.isNotValid &&
                state.item2.error != null &&
                state.item1.isFailure
            ? state.item2.error is EmptyTextError
                ? S.of(context).inputEmpty
                : S.of(context).notValidEmail
            : null;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 0, 55, 10),
              child: TextFormField(
                onChanged: (value) =>
                    context.read<AuthBloc>().emailChanged(value),
                readOnly: state.item1.isInProgress,
                keyboardType: TextInputType.emailAddress,
                cursorColor: seedBlue,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  errorBorder: underlineInputBorder,
                  focusedErrorBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  enabledBorder: underlineInputBorder,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: seedBlue,
                    size: 22,
                  ),
                  labelText: S.of(context).enterEmail,
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  floatingLabelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12),
                ),
              ),
            ),
            FormErrorText(error: errorInputText),
          ],
        );
      },
    );
  }
}
