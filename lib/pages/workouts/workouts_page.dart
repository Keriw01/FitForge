import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/workouts/cubit/workouts_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/current_plan_view.dart';
import 'package:fit_forge/pages/workouts/widgets/my_plans_view.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);

    return BlocBuilder<WorkoutsCubit, WorkoutsState>(
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: isLight
                  ? lightColorScheme.onPrimary
                  : darkColorScheme.background,
              iconTheme: IconThemeData(
                color: isLight ? defaultFontsColor : whiteColor,
              ),
              title: TabBar(
                indicatorColor: seedBlue,
                indicatorPadding: const EdgeInsets.only(bottom: 1),
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: seedBlue),
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                dividerColor: isLight ? defaultFontsColor : whiteColor,
                tabs: [
                  Tab(text: S.of(context).myPlansHeader),
                  Tab(text: S.of(context).currentPlanHeader),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () =>
                      context.read<SettingsCubit>().navigateToSettingsPage(),
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body: state.isLoading
                ? const Center(
                    child: CustomLoadingIndicator(),
                  )
                : const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      MyPlansView(),
                      CurrentPlanView(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
