// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState()';
}


}

/// @nodoc
class $VerifyEmailStateCopyWith<$Res>  {
$VerifyEmailStateCopyWith(VerifyEmailState _, $Res Function(VerifyEmailState) __);
}


/// Adds pattern-matching-related methods to [VerifyEmailState].
extension VerifyEmailStatePatterns on VerifyEmailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  verifyEmailLoading,TResult Function( SendEmailVerification value)?  sendEmailVerification,TResult Function( SendEmailFailure value)?  sendEmailFailure,TResult Function( LogOutFailure value)?  logOutFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when verifyEmailLoading != null:
return verifyEmailLoading(_that);case SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification(_that);case SendEmailFailure() when sendEmailFailure != null:
return sendEmailFailure(_that);case LogOutFailure() when logOutFailure != null:
return logOutFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  verifyEmailLoading,required TResult Function( SendEmailVerification value)  sendEmailVerification,required TResult Function( SendEmailFailure value)  sendEmailFailure,required TResult Function( LogOutFailure value)  logOutFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return verifyEmailLoading(_that);case SendEmailVerification():
return sendEmailVerification(_that);case SendEmailFailure():
return sendEmailFailure(_that);case LogOutFailure():
return logOutFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  verifyEmailLoading,TResult? Function( SendEmailVerification value)?  sendEmailVerification,TResult? Function( SendEmailFailure value)?  sendEmailFailure,TResult? Function( LogOutFailure value)?  logOutFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when verifyEmailLoading != null:
return verifyEmailLoading(_that);case SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification(_that);case SendEmailFailure() when sendEmailFailure != null:
return sendEmailFailure(_that);case LogOutFailure() when logOutFailure != null:
return logOutFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  verifyEmailLoading,TResult Function()?  sendEmailVerification,TResult Function()?  sendEmailFailure,TResult Function()?  logOutFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when verifyEmailLoading != null:
return verifyEmailLoading();case SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification();case SendEmailFailure() when sendEmailFailure != null:
return sendEmailFailure();case LogOutFailure() when logOutFailure != null:
return logOutFailure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  verifyEmailLoading,required TResult Function()  sendEmailVerification,required TResult Function()  sendEmailFailure,required TResult Function()  logOutFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return verifyEmailLoading();case SendEmailVerification():
return sendEmailVerification();case SendEmailFailure():
return sendEmailFailure();case LogOutFailure():
return logOutFailure();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  verifyEmailLoading,TResult? Function()?  sendEmailVerification,TResult? Function()?  sendEmailFailure,TResult? Function()?  logOutFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when verifyEmailLoading != null:
return verifyEmailLoading();case SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification();case SendEmailFailure() when sendEmailFailure != null:
return sendEmailFailure();case LogOutFailure() when logOutFailure != null:
return logOutFailure();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements VerifyEmailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState.initial()';
}


}




/// @nodoc


class Loading implements VerifyEmailState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState.verifyEmailLoading()';
}


}




/// @nodoc


class SendEmailVerification implements VerifyEmailState {
  const SendEmailVerification();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendEmailVerification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState.sendEmailVerification()';
}


}




/// @nodoc


class SendEmailFailure implements VerifyEmailState {
  const SendEmailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendEmailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState.sendEmailFailure()';
}


}




/// @nodoc


class LogOutFailure implements VerifyEmailState {
  const LogOutFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyEmailState.logOutFailure()';
}


}




// dart format on
