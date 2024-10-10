import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/models/session.dart';
import 'package:fit_forge/pages/progress/cubit/progress_cubit.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProgressCubit, ProgressState, List<Session>?>(
      selector: (state) {
        return state.sessions;
      },
      builder: (context, sessions) {
        final monthlyWeightLifted =
            context.read<ProgressCubit>().getMonthlyWeightLifted(sessions);
        final barChartData = createBarChartData(monthlyWeightLifted);

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  S.of(context).bodyStats,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).weight,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              S.of(context).height,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              S.of(context).bmi,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              S.of(context).age,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '70 kg',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              '182 cm',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              '26',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              '21',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      FontAwesomeIcons.person,
                      size: 124,
                      color: seedBlue,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).update,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).summaryWeightLifted,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: BarChart(
                    BarChartData(
                      maxY: (monthlyWeightLifted.values.isNotEmpty
                          ? monthlyWeightLifted.values
                                  .reduce((a, b) => a > b ? a : b) +
                              10
                          : 100),
                      barGroups: barChartData,
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              String monthKey = monthlyWeightLifted.keys
                                  .elementAt(value.toInt());
                              return Text(monthKey);
                            },
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
                // Text(
                //   S.of(context).muscleBreakdown,
                //   style: Theme.of(context).textTheme.headlineMedium,
                // ),
                // const SizedBox(height: 20),
                // AspectRatio(
                //   aspectRatio: 1.5,
                //   child: PieChart(
                //     PieChartData(

                //         ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<BarChartGroupData> createBarChartData(Map<String, double> monthlyData) {
  List<BarChartGroupData> barGroups = [];

  int index = 0;
  monthlyData.forEach((month, weightLifted) {
    barGroups.add(
      BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: weightLifted,
            color: Colors.blue,
          ),
        ],
      ),
    );
    index++;
  });

  return barGroups;
}
