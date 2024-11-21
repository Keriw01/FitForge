import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/pages/progress/widgets/history_view.dart';
import 'package:fit_forge/pages/progress/widgets/insights_view.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:fit_forge/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  void initState() {
    context.read<ProgressCubit>().getUserProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);

    return BlocBuilder<ProgressCubit, ProgressState>(
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
                  Tab(text: S.of(context).insightsHeader),
                  Tab(text: S.of(context).historyHeader),
                ],
              ),
            ),
            body: state.isLoading
                ? const Center(
                    child: CustomLoadingIndicator(),
                  )
                : const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InsightsView(),
                      HistoryView(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
