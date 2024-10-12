import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsightsSheetContent extends StatelessWidget {
  const InsightsSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);

    return BlocBuilder<ProgressCubit, ProgressState>(
      builder: (context, state) {
        final cubit = context.read<ProgressCubit>();

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => cubit.clearForm(),
                    child: Text(
                      S.of(context).discard,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    S.of(context).editBodyStats,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: isLight ? defaultFontsColor : null),
                  ),
                  TextButton(
                    onPressed: () => cubit.updateUserBodyStats(),
                    child: Text(
                      S.of(context).save,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).weight,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: state.inputWeight != null
                                    ? state.inputWeight.toString()
                                    : '',
                                onChanged: (value) => cubit.updateWeight(
                                  double.tryParse(value),
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9\.]'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'kg',
                                ),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).height,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: state.inputHeight,
                                onChanged: (value) => cubit.updateHeight(value),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'cm',
                                ),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).age,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: state.inputAge != null
                                    ? state.inputAge.toString()
                                    : '',
                                onChanged: (value) => cubit.updateAge(
                                  int.tryParse(value),
                                ),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'age',
                                ),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
