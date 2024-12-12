import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsightsSheetContent extends StatelessWidget {
  const InsightsSheetContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);
    final unitSystem =
        context.select((SettingsCubit b) => b.state.userProfile!.unitSystem);

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
                                S.of(context).userWeight,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: state.inputWeight != null
                                    ? formatWeightInRightUnit(
                                        unitSystem: unitSystem,
                                        weight: state.inputWeight.toString(),
                                        displayUnit: false)
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
                                decoration: InputDecoration(
                                  hintText:
                                      displayWeightUnit(unitSystem: unitSystem),
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
                                initialValue: formatHeightInRightUnit(
                                    unitSystem: unitSystem,
                                    height: state.inputHeight ?? '0',
                                    displayUnit: false),
                                onChanged: (value) => cubit.updateHeight(value),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText:
                                      displayHeightUnit(unitSystem: unitSystem),
                                ),
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         S.of(context).age,
                        //         style: Theme.of(context).textTheme.labelMedium,
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 2,
                        //       child: ElevatedButton(
                        //         onPressed: () => context
                        //             .read<ProgressCubit>()
                        //             .navigateToSettingsPage(),
                        //         child: Text(
                        //           S.of(context).changeBirthDate,
                        //           textAlign: TextAlign.center,
                        //           style:
                        //               Theme.of(context).textTheme.displaySmall,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 16),
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
