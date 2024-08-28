part of 'qr_cubit.dart';

@CopyWith()
class QrState with EquatableMixin {
  final String? barcode;
  final QrScanErrorMessage qrScanErrorMessage;

  QrState({
    this.barcode,
    this.qrScanErrorMessage = QrScanErrorMessage.none,
  });

  @override
  List<Object?> get props => [
        barcode,
        qrScanErrorMessage,
      ];
}
