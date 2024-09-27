import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/scan_qr_code/cubit/qr_cubit.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QrCodePage extends StatelessWidget {
  QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).scanQrLabel,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocListener<QrCubit, QrState>(
        listener: (context, state) {
          if (state.qrScanErrorMessage != QrScanErrorMessage.none) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getQrScanError(state.qrScanErrorMessage, context)!,
                ),
              ),
            );
          }
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).scanQrFirstHeader,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        S.of(context).scanQrFirstDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).scanQrSecondHeader,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        S.of(context).scanQrFirstPoint,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text("•"),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              S.of(context).scanQrSecondPoint,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text("•"),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              S.of(context).scanQrThirdPoint,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text("•"),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              S.of(context).scanQrFourPoint,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).scanQrThirdHeader,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () =>
                            {context.read<QrCubit>().tryNavigateToScanPage()},
                        child: Text(
                          S.of(context).scanQrLabel,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const WorkoutSessionFloating(),
          ],
        ),
      ),
    );
  }
}
