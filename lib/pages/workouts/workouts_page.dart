import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/pages/settings/cubit/settings_cubit.dart';
import 'package:fit_forge/pages/workouts/widgets/current_plan_view.dart';
import 'package:fit_forge/pages/workouts/widgets/my_plans_view.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WorkoutsPage extends StatelessWidget {
  WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isLight
              ? whiteColor
              : Theme.of(context).appBarTheme.backgroundColor,
          iconTheme: IconThemeData(
            color: isLight
                ? defaultFontsColor
                : Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          title: const TabBar(
            tabs: [
              Tab(text: 'My plans'),
              Tab(text: 'Current'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  context.read<SettingsCubit>().navigateToSettingsPage(),
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MyPlansView(),
            CurrentPlanView(),
          ],
        ),
      ),
    );
  }
}
