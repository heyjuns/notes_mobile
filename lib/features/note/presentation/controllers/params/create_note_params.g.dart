// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateNoteParams _$CreateNoteParamsFromJson(Map<String, dynamic> json) =>
    _CreateNoteParams(
      userId: json['userId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateNoteParamsToJson(_CreateNoteParams instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
    };
