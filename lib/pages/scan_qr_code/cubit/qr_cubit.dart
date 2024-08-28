import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_forge/base_cubit/base_cubit.dart';
import 'package:fit_forge/consts/enums.dart';
import 'package:fit_forge/models/exercises.dart';
import 'package:fit_forge/pages/exercises/cubit/exercises_cubit.dart';
import 'package:fit_forge/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

part 'qr_state.dart';
part 'qr_cubit.g.dart';

class QrCubit extends BaseCubit<QrState> {
  final ExercisesCubit exercisesCubit;

  QrCubit(AppRouter appRouter, BuildContext context, this.exercisesCubit)
      : super(
          appRouter,
          QrState(),
        );

  void setBarcode(String? barcode) {
    if (barcode == null || barcode.isEmpty) {
      emit(state.copyWith(
        barcode: null,
        qrScanErrorMessage: QrScanErrorMessage.invalidBarcode,
      ));
      appRouter.maybePop();
      return;
    }

    final List<Exercises>? exercises = exercisesCubit.state.exercises;

    Exercises? exercisesItem;
    if (exercises != null) {
      try {
        exercisesItem = exercises.firstWhere(
            (exerciseItem) => exerciseItem.exercise.qrCode == barcode);
      } catch (e) {
        exercisesItem = null;
      }
    }

    if (exercisesItem == null) {
      emit(state.copyWith(
        qrScanErrorMessage: QrScanErrorMessage.qrCodeNotFound,
      ));

      appRouter.maybePop();
    } else {
      emit(state.copyWith(
        barcode: barcode,
      ));

      appRouter.replaceAll([
        QrCodeRoute(),
        ExerciseDetailRoute(exercise: exercisesItem.exercise),
      ]);
    }
  }

  void tryNavigateToScanPage() async {
    emit(state.copyWith(
      barcode: null,
      qrScanErrorMessage: QrScanErrorMessage.none,
    ));

    var permission = Permission.camera;

    final status = await permission.request();
    if (status.isGranted) {
      appRouter.push(QrScanRoute());
    } else if (status.isDenied) {
      emit(state.copyWith(
        qrScanErrorMessage: QrScanErrorMessage.cameraAccessDenied,
      ));
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else if (status.isLimited || status.isRestricted) {
      emit(state.copyWith(
        qrScanErrorMessage: QrScanErrorMessage.cameraAccessLimited,
      ));
    }
  }

  void closeScanner() {
    emit(state.copyWith(
      barcode: null,
      qrScanErrorMessage: QrScanErrorMessage.none,
    ));

    appRouter.maybePop();
  }
}
