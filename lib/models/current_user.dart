import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user.freezed.dart';
part 'current_user.g.dart';

@freezed

/// Biężąco zalogowany użytkownik, najważniejsze pole userId
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required String userId,
    required String email,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);
}
