import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation.freezed.dart';
part 'translation.g.dart';

@freezed

/// Represents a translation object, containing English and Polish translations for a specific text from firestore data
class Translation with _$Translation {
  factory Translation({
    required String en,
    required String pl,
  }) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}
