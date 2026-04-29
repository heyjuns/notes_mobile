import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_note_params.freezed.dart';
part 'create_note_params.g.dart';

@freezed
abstract class CreateNoteParams with _$CreateNoteParams {
  factory CreateNoteParams({
    required String userId,
    required String title,
    required String content,
  }) = _CreateNoteParams;

  factory CreateNoteParams.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteParamsFromJson(json);
}
