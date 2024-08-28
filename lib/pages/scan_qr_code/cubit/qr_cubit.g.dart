// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QrStateCWProxy {
  QrState barcode(String? barcode);

  QrState qrScanErrorMessage(QrScanErrorMessage qrScanErrorMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QrState(...).copyWith(id: 12, name: "My name")
  /// ````
  QrState call({
    String? barcode,
    QrScanErrorMessage? qrScanErrorMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQrState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQrState.copyWith.fieldName(...)`
class _$QrStateCWProxyImpl implements _$QrStateCWProxy {
  const _$QrStateCWProxyImpl(this._value);

  final QrState _value;

  @override
  QrState barcode(String? barcode) => this(barcode: barcode);

  @override
  QrState qrScanErrorMessage(QrScanErrorMessage qrScanErrorMessage) =>
      this(qrScanErrorMessage: qrScanErrorMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QrState(...).copyWith(id: 12, name: "My name")
  /// ````
  QrState call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? qrScanErrorMessage = const $CopyWithPlaceholder(),
  }) {
    return QrState(
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      qrScanErrorMessage: qrScanErrorMessage == const $CopyWithPlaceholder() ||
              qrScanErrorMessage == null
          ? _value.qrScanErrorMessage
          // ignore: cast_nullable_to_non_nullable
          : qrScanErrorMessage as QrScanErrorMessage,
    );
  }
}

extension $QrStateCopyWith on QrState {
  /// Returns a callable class that can be used as follows: `instanceOfQrState.copyWith(...)` or like so:`instanceOfQrState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QrStateCWProxy get copyWith => _$QrStateCWProxyImpl(this);
}
