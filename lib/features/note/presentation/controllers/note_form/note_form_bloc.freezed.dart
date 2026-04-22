// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteFormEvent {

 String get title; String get content;
/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteFormEventCopyWith<NoteFormEvent> get copyWith => _$NoteFormEventCopyWithImpl<NoteFormEvent>(this as NoteFormEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteFormEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,title,content);

@override
String toString() {
  return 'NoteFormEvent(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $NoteFormEventCopyWith<$Res>  {
  factory $NoteFormEventCopyWith(NoteFormEvent value, $Res Function(NoteFormEvent) _then) = _$NoteFormEventCopyWithImpl;
@useResult
$Res call({
 String title, String content
});




}
/// @nodoc
class _$NoteFormEventCopyWithImpl<$Res>
    implements $NoteFormEventCopyWith<$Res> {
  _$NoteFormEventCopyWithImpl(this._self, this._then);

  final NoteFormEvent _self;
  final $Res Function(NoteFormEvent) _then;

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteFormEvent].
extension NoteFormEventPatterns on NoteFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateNote value)?  createNote,TResult Function( _UpdateNote value)?  updateNote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNote() when createNote != null:
return createNote(_that);case _UpdateNote() when updateNote != null:
return updateNote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateNote value)  createNote,required TResult Function( _UpdateNote value)  updateNote,}){
final _that = this;
switch (_that) {
case _CreateNote():
return createNote(_that);case _UpdateNote():
return updateNote(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateNote value)?  createNote,TResult? Function( _UpdateNote value)?  updateNote,}){
final _that = this;
switch (_that) {
case _CreateNote() when createNote != null:
return createNote(_that);case _UpdateNote() when updateNote != null:
return updateNote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String title,  String content)?  createNote,TResult Function( NoteEntity note,  String title,  String content)?  updateNote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNote() when createNote != null:
return createNote(_that.userId,_that.title,_that.content);case _UpdateNote() when updateNote != null:
return updateNote(_that.note,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String title,  String content)  createNote,required TResult Function( NoteEntity note,  String title,  String content)  updateNote,}) {final _that = this;
switch (_that) {
case _CreateNote():
return createNote(_that.userId,_that.title,_that.content);case _UpdateNote():
return updateNote(_that.note,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String title,  String content)?  createNote,TResult? Function( NoteEntity note,  String title,  String content)?  updateNote,}) {final _that = this;
switch (_that) {
case _CreateNote() when createNote != null:
return createNote(_that.userId,_that.title,_that.content);case _UpdateNote() when updateNote != null:
return updateNote(_that.note,_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNote implements NoteFormEvent {
  const _CreateNote({required this.userId, required this.title, required this.content});
  

 final  String userId;
@override final  String title;
@override final  String content;

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNoteCopyWith<_CreateNote> get copyWith => __$CreateNoteCopyWithImpl<_CreateNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNote&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,userId,title,content);

@override
String toString() {
  return 'NoteFormEvent.createNote(userId: $userId, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$CreateNoteCopyWith<$Res> implements $NoteFormEventCopyWith<$Res> {
  factory _$CreateNoteCopyWith(_CreateNote value, $Res Function(_CreateNote) _then) = __$CreateNoteCopyWithImpl;
@override @useResult
$Res call({
 String userId, String title, String content
});




}
/// @nodoc
class __$CreateNoteCopyWithImpl<$Res>
    implements _$CreateNoteCopyWith<$Res> {
  __$CreateNoteCopyWithImpl(this._self, this._then);

  final _CreateNote _self;
  final $Res Function(_CreateNote) _then;

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? title = null,Object? content = null,}) {
  return _then(_CreateNote(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateNote implements NoteFormEvent {
  const _UpdateNote({required this.note, required this.title, required this.content});
  

 final  NoteEntity note;
@override final  String title;
@override final  String content;

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateNoteCopyWith<_UpdateNote> get copyWith => __$UpdateNoteCopyWithImpl<_UpdateNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateNote&&(identical(other.note, note) || other.note == note)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,note,title,content);

@override
String toString() {
  return 'NoteFormEvent.updateNote(note: $note, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$UpdateNoteCopyWith<$Res> implements $NoteFormEventCopyWith<$Res> {
  factory _$UpdateNoteCopyWith(_UpdateNote value, $Res Function(_UpdateNote) _then) = __$UpdateNoteCopyWithImpl;
@override @useResult
$Res call({
 NoteEntity note, String title, String content
});


$NoteEntityCopyWith<$Res> get note;

}
/// @nodoc
class __$UpdateNoteCopyWithImpl<$Res>
    implements _$UpdateNoteCopyWith<$Res> {
  __$UpdateNoteCopyWithImpl(this._self, this._then);

  final _UpdateNote _self;
  final $Res Function(_UpdateNote) _then;

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? note = null,Object? title = null,Object? content = null,}) {
  return _then(_UpdateNote(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of NoteFormEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteEntityCopyWith<$Res> get note {
  
  return $NoteEntityCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc
mixin _$NoteFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteFormState()';
}


}

/// @nodoc
class $NoteFormStateCopyWith<$Res>  {
$NoteFormStateCopyWith(NoteFormState _, $Res Function(NoteFormState) __);
}


/// Adds pattern-matching-related methods to [NoteFormState].
extension NoteFormStatePatterns on NoteFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NoteEntity note)?  success,TResult Function( Failure error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.note);case _Failed() when failed != null:
return failed(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NoteEntity note)  success,required TResult Function( Failure error)  failed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.note);case _Failed():
return failed(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NoteEntity note)?  success,TResult? Function( Failure error)?  failed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.note);case _Failed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NoteFormState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteFormState.initial()';
}


}




/// @nodoc


class _Loading implements NoteFormState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteFormState.loading()';
}


}




/// @nodoc


class _Success implements NoteFormState {
  const _Success(this.note);
  

 final  NoteEntity note;

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'NoteFormState.success(note: $note)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $NoteFormStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 NoteEntity note
});


$NoteEntityCopyWith<$Res> get note;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_Success(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,
  ));
}

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteEntityCopyWith<$Res> get note {
  
  return $NoteEntityCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc


class _Failed implements NoteFormState {
  const _Failed({required this.error});
  

 final  Failure error;

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NoteFormState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $NoteFormStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 Failure error
});


$FailureCopyWith<$Res> get error;

}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failed(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of NoteFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get error {
  
  return $FailureCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
