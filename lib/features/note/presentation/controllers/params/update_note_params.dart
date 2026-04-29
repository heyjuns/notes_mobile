import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_note_params.freezed.dart';
part 'update_note_params.g.dart';

@freezed
abstract class UpdateNoteParams with _$UpdateNoteParams {
  factory UpdateNoteParams({
    required String id,
    required String title,
    required String content,
  }) = _UpdateNoteParams;

  factory UpdateNoteParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateNoteParamsFromJson(json);
}
