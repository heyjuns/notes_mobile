import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_params.freezed.dart';
part 'sign_up_params.g.dart';

@freezed
abstract class SignUpParams with _$SignUpParams {
  factory SignUpParams({
    required String email,
    required String password,
    required String name,
  }) = _SignUpParams;

  factory SignUpParams.fromJson(Map<String, dynamic> json) =>
      _$SignUpParamsFromJson(json);
}
