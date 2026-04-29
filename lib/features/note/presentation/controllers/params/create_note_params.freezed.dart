// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_note_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateNoteParams {

 String get userId; String get title; String get content;
/// Create a copy of CreateNoteParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNoteParamsCopyWith<CreateNoteParams> get copyWith => _$CreateNoteParamsCopyWithImpl<CreateNoteParams>(this as CreateNoteParams, _$identity);

  /// Serializes this CreateNoteParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNoteParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,title,content);

@override
String toString() {
  return 'CreateNoteParams(userId: $userId, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $CreateNoteParamsCopyWith<$Res>  {
  factory $CreateNoteParamsCopyWith(CreateNoteParams value, $Res Function(CreateNoteParams) _then) = _$CreateNoteParamsCopyWithImpl;
@useResult
$Res call({
 String userId, String title, String content
});




}
/// @nodoc
class _$CreateNoteParamsCopyWithImpl<$Res>
    implements $CreateNoteParamsCopyWith<$Res> {
  _$CreateNoteParamsCopyWithImpl(this._self, this._then);

  final CreateNoteParams _self;
  final $Res Function(CreateNoteParams) _then;

/// Create a copy of CreateNoteParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateNoteParams].
extension CreateNoteParamsPatterns on CreateNoteParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateNoteParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNoteParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateNoteParams value)  $default,){
final _that = this;
switch (_that) {
case _CreateNoteParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateNoteParams value)?  $default,){
final _that = this;
switch (_that) {
case _CreateNoteParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String title,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNoteParams() when $default != null:
return $default(_that.userId,_that.title,_that.content);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String title,  String content)  $default,) {final _that = this;
switch (_that) {
case _CreateNoteParams():
return $default(_that.userId,_that.title,_that.content);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String title,  String content)?  $default,) {final _that = this;
switch (_that) {
case _CreateNoteParams() when $default != null:
return $default(_that.userId,_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateNoteParams implements CreateNoteParams {
   _CreateNoteParams({required this.userId, required this.title, required this.content});
  factory _CreateNoteParams.fromJson(Map<String, dynamic> json) => _$CreateNoteParamsFromJson(json);

@override final  String userId;
@override final  String title;
@override final  String content;

/// Create a copy of CreateNoteParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNoteParamsCopyWith<_CreateNoteParams> get copyWith => __$CreateNoteParamsCopyWithImpl<_CreateNoteParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateNoteParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNoteParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,title,content);

@override
String toString() {
  return 'CreateNoteParams(userId: $userId, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$CreateNoteParamsCopyWith<$Res> implements $CreateNoteParamsCopyWith<$Res> {
  factory _$CreateNoteParamsCopyWith(_CreateNoteParams value, $Res Function(_CreateNoteParams) _then) = __$CreateNoteParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String title, String content
});




}
/// @nodoc
class __$CreateNoteParamsCopyWithImpl<$Res>
    implements _$CreateNoteParamsCopyWith<$Res> {
  __$CreateNoteParamsCopyWithImpl(this._self, this._then);

  final _CreateNoteParams _self;
  final $Res Function(_CreateNoteParams) _then;

/// Create a copy of CreateNoteParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? title = null,Object? content = null,}) {
  return _then(_CreateNoteParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
