// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState()';
}


}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res>  {
$ForgotPasswordStateCopyWith(ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SendPasswordResetEmailLoading value)?  sendPasswordResetEmailLoading,TResult Function( SendPasswordResetEmailSuccess value)?  sendPasswordResetEmailSuccess,TResult Function( SendPasswordResetEmailFailure value)?  sendPasswordResetEmailFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SendPasswordResetEmailLoading() when sendPasswordResetEmailLoading != null:
return sendPasswordResetEmailLoading(_that);case SendPasswordResetEmailSuccess() when sendPasswordResetEmailSuccess != null:
return sendPasswordResetEmailSuccess(_that);case SendPasswordResetEmailFailure() when sendPasswordResetEmailFailure != null:
return sendPasswordResetEmailFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SendPasswordResetEmailLoading value)  sendPasswordResetEmailLoading,required TResult Function( SendPasswordResetEmailSuccess value)  sendPasswordResetEmailSuccess,required TResult Function( SendPasswordResetEmailFailure value)  sendPasswordResetEmailFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SendPasswordResetEmailLoading():
return sendPasswordResetEmailLoading(_that);case SendPasswordResetEmailSuccess():
return sendPasswordResetEmailSuccess(_that);case SendPasswordResetEmailFailure():
return sendPasswordResetEmailFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SendPasswordResetEmailLoading value)?  sendPasswordResetEmailLoading,TResult? Function( SendPasswordResetEmailSuccess value)?  sendPasswordResetEmailSuccess,TResult? Function( SendPasswordResetEmailFailure value)?  sendPasswordResetEmailFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SendPasswordResetEmailLoading() when sendPasswordResetEmailLoading != null:
return sendPasswordResetEmailLoading(_that);case SendPasswordResetEmailSuccess() when sendPasswordResetEmailSuccess != null:
return sendPasswordResetEmailSuccess(_that);case SendPasswordResetEmailFailure() when sendPasswordResetEmailFailure != null:
return sendPasswordResetEmailFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendPasswordResetEmailLoading,TResult Function( String message)?  sendPasswordResetEmailSuccess,TResult Function( AppFailure appFailure)?  sendPasswordResetEmailFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SendPasswordResetEmailLoading() when sendPasswordResetEmailLoading != null:
return sendPasswordResetEmailLoading();case SendPasswordResetEmailSuccess() when sendPasswordResetEmailSuccess != null:
return sendPasswordResetEmailSuccess(_that.message);case SendPasswordResetEmailFailure() when sendPasswordResetEmailFailure != null:
return sendPasswordResetEmailFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendPasswordResetEmailLoading,required TResult Function( String message)  sendPasswordResetEmailSuccess,required TResult Function( AppFailure appFailure)  sendPasswordResetEmailFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SendPasswordResetEmailLoading():
return sendPasswordResetEmailLoading();case SendPasswordResetEmailSuccess():
return sendPasswordResetEmailSuccess(_that.message);case SendPasswordResetEmailFailure():
return sendPasswordResetEmailFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendPasswordResetEmailLoading,TResult? Function( String message)?  sendPasswordResetEmailSuccess,TResult? Function( AppFailure appFailure)?  sendPasswordResetEmailFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SendPasswordResetEmailLoading() when sendPasswordResetEmailLoading != null:
return sendPasswordResetEmailLoading();case SendPasswordResetEmailSuccess() when sendPasswordResetEmailSuccess != null:
return sendPasswordResetEmailSuccess(_that.message);case SendPasswordResetEmailFailure() when sendPasswordResetEmailFailure != null:
return sendPasswordResetEmailFailure(_that.appFailure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgotPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.initial()';
}


}




/// @nodoc


class SendPasswordResetEmailLoading implements ForgotPasswordState {
  const SendPasswordResetEmailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPasswordResetEmailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.sendPasswordResetEmailLoading()';
}


}




/// @nodoc


class SendPasswordResetEmailSuccess implements ForgotPasswordState {
  const SendPasswordResetEmailSuccess(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendPasswordResetEmailSuccessCopyWith<SendPasswordResetEmailSuccess> get copyWith => _$SendPasswordResetEmailSuccessCopyWithImpl<SendPasswordResetEmailSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPasswordResetEmailSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.sendPasswordResetEmailSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendPasswordResetEmailSuccessCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory $SendPasswordResetEmailSuccessCopyWith(SendPasswordResetEmailSuccess value, $Res Function(SendPasswordResetEmailSuccess) _then) = _$SendPasswordResetEmailSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendPasswordResetEmailSuccessCopyWithImpl<$Res>
    implements $SendPasswordResetEmailSuccessCopyWith<$Res> {
  _$SendPasswordResetEmailSuccessCopyWithImpl(this._self, this._then);

  final SendPasswordResetEmailSuccess _self;
  final $Res Function(SendPasswordResetEmailSuccess) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SendPasswordResetEmailSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendPasswordResetEmailFailure implements ForgotPasswordState {
  const SendPasswordResetEmailFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendPasswordResetEmailFailureCopyWith<SendPasswordResetEmailFailure> get copyWith => _$SendPasswordResetEmailFailureCopyWithImpl<SendPasswordResetEmailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPasswordResetEmailFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ForgotPasswordState.sendPasswordResetEmailFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $SendPasswordResetEmailFailureCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory $SendPasswordResetEmailFailureCopyWith(SendPasswordResetEmailFailure value, $Res Function(SendPasswordResetEmailFailure) _then) = _$SendPasswordResetEmailFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$SendPasswordResetEmailFailureCopyWithImpl<$Res>
    implements $SendPasswordResetEmailFailureCopyWith<$Res> {
  _$SendPasswordResetEmailFailureCopyWithImpl(this._self, this._then);

  final SendPasswordResetEmailFailure _self;
  final $Res Function(SendPasswordResetEmailFailure) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(SendPasswordResetEmailFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
