import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/pages/auth/cubit/auth_cubit.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/settings/widgets/birth_date_row.dart';
import 'package:fit_forge/pages/settings/widgets/current_workout_level_row.dart';
import 'package:fit_forge/pages/settings/widgets/default_reps_row.dart';
import 'package:fit_forge/pages/settings/widgets/default_sets_row.dart';
import 'package:fit_forge/pages/settings/widgets/email_row.dart';
import 'package:fit_forge/pages/settings/widgets/gender_row.dart';
import 'package:fit_forge/pages/settings/widgets/connect_with_google_fit_row.dart';
import 'package:fit_forge/pages/settings/widgets/logout_button.dart';
import 'package:fit_forge/pages/settings/widgets/top_goal_row.dart';
import 'package:fit_forge/pages/settings/widgets/unit_system_row.dart';
import 'package:fit_forge/pages/settings/widgets/user_name_row.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        S.of(context).settingsTitle,
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state.firestoreResponseMessage != FirestoreResponseMessage.none) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getFirestoreResponseError(
                      state.firestoreResponseMessage, context)!,
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

          return Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //TODO
                        // Obsłużyć możliwości dodania zdjęcia profilowego z pamięci urządzenia
                        const SizedBox(height: 20),
                        CircleAvatar(
                          minRadius: 32,
                          child: state.userProfile?.photoUrl != null
                              ? Image.network(state.userProfile!.photoUrl!)
                              : const Icon(Icons.person, size: 48),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).basicInformation,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 5),
                              EmailRow(
                                label: S.of(context).emailLabel,
                                value: state.userProfile?.email,
                              ),
                              UserNameRow(
                                userName: state.userProfile?.userName,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              GenderRow(
                                gender: state.userProfile?.gender,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              BirthDateRow(
                                birthDate: state.userProfile?.birthDate,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              //TODO
                              // Pominięta lokacja, w tej chwili nie potrzebna
                              //
                              // SettingRow(
                              //   label: S.of(context).basicGymLocationLabel,
                              //   value: formatGeoPoint(
                              //       state.userProfile?.basicGymLocation),
                              //   onTap: () {},
                              // ),
                              CurrentWorkoutLevelRow(
                                currentWorkoutLevel:
                                    state.userProfile?.currentWorkoutLevel,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              TopGoalRow(
                                topGoal: state.userProfile?.topGoal,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              const SizedBox(height: 25),
                              Text(
                                S.of(context).other,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 5),
                              UnitSystemRow(
                                unitSystem: state.userProfile?.unitSystem,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              DefaultSetsRow(
                                defaultSets:
                                    state.userProfile?.defaultSets.toString(),
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              DefaultRepsRow(
                                defaultReps:
                                    state.userProfile?.defaultReps.toString(),
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                              ConnectWithGoogleFitRow(
                                isConnectWithGoogleFit:
                                    state.userProfile?.isConnectWithGoogleFit,
                                profileCurrenRow: state.profileCurrenRow,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        LogOutButton(
                          onPressed: () =>
                              context.read<AuthCubit>().logOut(context),
                          text: S.of(context).logOut,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const WorkoutSessionFloating(
                isLock: true,
                isSmall: false,
              ),
            ],
          );
        },
      ),
    );
  }
}
