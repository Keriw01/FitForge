import 'package:auto_route/auto_route.dart';
import 'package:fit_forge/generated/l10n.dart';
import 'package:fit_forge/pages/scan_qr_code/cubit/qr_cubit.dart';
import 'package:fit_forge/pages/workouts/session/widgets/workout_session_floating.dart';
import 'package:fit_forge/styles/app_colors.dart';
import 'package:fit_forge/utils/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = isLightTheme(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).scanQrLabel,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: isLight ? defaultFontsColor : whiteColor),
        ),
        backgroundColor: isLight
            ? whiteColor
            : Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: isLight ? defaultFontsColor : whiteColor,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              // final Uint8List? image = capture.image;
              context.read<QrCubit>().setBarcode(barcodes.first.rawValue);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                  right: 15,
                  bottom: 10,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  S.of(context).scanQrInfo,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: defaultFontsColor),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () => context.read<QrCubit>().closeScanner(),
                    child: Text(
                      S.of(context).close,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const WorkoutSessionFloating(bottomPostion: 70),
        ],
      ),
    );
  }
}
