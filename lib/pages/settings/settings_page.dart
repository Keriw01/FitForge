import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/settings/widgets/setting_row.dart';
import 'package:fit_forge/utils/formation/formation.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settingsTitle)),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state.profileResponseMessage != ProfileResponseMessage.none) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  context
                      .read<SettingsCubit>()
                      .getResponseError(state.profileResponseMessage, context)!,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }

          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 32,
                    child: state.userProfile?.photoUrl != null
                        ? Image.network(state.userProfile!.photoUrl!)
                        : const Icon(Icons.person_outline, size: 48),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).basicInformation,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SettingRow(
                          label: S.of(context).usernameLabel,
                          value: state.userProfile?.userName,
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).emailLabel,
                          value: state.userProfile?.email,
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).genderLabel,
                          value: state.userProfile?.gender,
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).birthDateLabel,
                          value: state.userProfile?.birthDate != null
                              ? DateFormat('dd.MM.yyyy')
                                  .format(state.userProfile!.birthDate!)
                              : S.of(context).noData,
                          onTap: () {},
                        ),
                        //TODO
                        //Pominięta lokacja, w tej chwili nie potrzebna
                        //
                        // SettingRow(
                        //   label: S.of(context).basicGymLocationLabel,
                        //   value: formatGeoPoint(
                        //       state.userProfile?.basicGymLocation),
                        //   onTap: () {},
                        // ),
                        SettingRow(
                          label: S.of(context).currentWorkoutLevelLabel,
                          value: state.userProfile?.currentWorkoutLevel,
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).topGoalLabel,
                          value: state.userProfile?.topGoal,
                          onTap: () {},
                        ),
                        const SizedBox(height: 25),
                        Text(
                          S.of(context).other,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SettingRow(
                          label: S.of(context).unitSystem,
                          value: state.userProfile?.unitSystem,
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).defaultReps,
                          value: state.userProfile?.defaultReps.toString(),
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).defaultsSets,
                          value: state.userProfile?.defaultSets.toString(),
                          onTap: () {},
                        ),
                        SettingRow(
                          label: S.of(context).connectWithGoogleFit,
                          value: state.userProfile?.isConnectWithGoogleFit
                              .toString(),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      child: Text(S.of(context).logOut),
                      onPressed: () =>
                          context.read<AuthCubit>().logOut(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
