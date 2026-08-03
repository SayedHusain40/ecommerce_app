// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ProfileLogoutLoading value)?  logoutLoading,TResult Function( _ProfileLogoutSuccess value)?  logoutSuccess,TResult Function( _ProfileLogoutFailure value)?  logoutFailure,TResult Function( CheckPasswordLoading value)?  checkPasswordLoading,TResult Function( CheckPasswordSuccess value)?  checkPasswordSuccess,TResult Function( CheckPasswordFailure value)?  checkPasswordFailure,TResult Function( ChangePasswordLoading value)?  changePasswordLoading,TResult Function( ChangePasswordSuccess value)?  changePasswordSuccess,TResult Function( ChangePasswordFailure value)?  changePasswordFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ProfileLogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case _ProfileLogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case _ProfileLogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case CheckPasswordLoading() when checkPasswordLoading != null:
return checkPasswordLoading(_that);case CheckPasswordSuccess() when checkPasswordSuccess != null:
return checkPasswordSuccess(_that);case CheckPasswordFailure() when checkPasswordFailure != null:
return checkPasswordFailure(_that);case ChangePasswordLoading() when changePasswordLoading != null:
return changePasswordLoading(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case ChangePasswordFailure() when changePasswordFailure != null:
return changePasswordFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ProfileLogoutLoading value)  logoutLoading,required TResult Function( _ProfileLogoutSuccess value)  logoutSuccess,required TResult Function( _ProfileLogoutFailure value)  logoutFailure,required TResult Function( CheckPasswordLoading value)  checkPasswordLoading,required TResult Function( CheckPasswordSuccess value)  checkPasswordSuccess,required TResult Function( CheckPasswordFailure value)  checkPasswordFailure,required TResult Function( ChangePasswordLoading value)  changePasswordLoading,required TResult Function( ChangePasswordSuccess value)  changePasswordSuccess,required TResult Function( ChangePasswordFailure value)  changePasswordFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ProfileLogoutLoading():
return logoutLoading(_that);case _ProfileLogoutSuccess():
return logoutSuccess(_that);case _ProfileLogoutFailure():
return logoutFailure(_that);case CheckPasswordLoading():
return checkPasswordLoading(_that);case CheckPasswordSuccess():
return checkPasswordSuccess(_that);case CheckPasswordFailure():
return checkPasswordFailure(_that);case ChangePasswordLoading():
return changePasswordLoading(_that);case ChangePasswordSuccess():
return changePasswordSuccess(_that);case ChangePasswordFailure():
return changePasswordFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ProfileLogoutLoading value)?  logoutLoading,TResult? Function( _ProfileLogoutSuccess value)?  logoutSuccess,TResult? Function( _ProfileLogoutFailure value)?  logoutFailure,TResult? Function( CheckPasswordLoading value)?  checkPasswordLoading,TResult? Function( CheckPasswordSuccess value)?  checkPasswordSuccess,TResult? Function( CheckPasswordFailure value)?  checkPasswordFailure,TResult? Function( ChangePasswordLoading value)?  changePasswordLoading,TResult? Function( ChangePasswordSuccess value)?  changePasswordSuccess,TResult? Function( ChangePasswordFailure value)?  changePasswordFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ProfileLogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case _ProfileLogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case _ProfileLogoutFailure() when logoutFailure != null:
return logoutFailure(_that);case CheckPasswordLoading() when checkPasswordLoading != null:
return checkPasswordLoading(_that);case CheckPasswordSuccess() when checkPasswordSuccess != null:
return checkPasswordSuccess(_that);case CheckPasswordFailure() when checkPasswordFailure != null:
return checkPasswordFailure(_that);case ChangePasswordLoading() when changePasswordLoading != null:
return changePasswordLoading(_that);case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess(_that);case ChangePasswordFailure() when changePasswordFailure != null:
return changePasswordFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  logoutLoading,TResult Function()?  logoutSuccess,TResult Function( AppFailure appFailure)?  logoutFailure,TResult Function()?  checkPasswordLoading,TResult Function()?  checkPasswordSuccess,TResult Function( AppFailure appFailure)?  checkPasswordFailure,TResult Function()?  changePasswordLoading,TResult Function()?  changePasswordSuccess,TResult Function( AppFailure appFailure)?  changePasswordFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ProfileLogoutLoading() when logoutLoading != null:
return logoutLoading();case _ProfileLogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case _ProfileLogoutFailure() when logoutFailure != null:
return logoutFailure(_that.appFailure);case CheckPasswordLoading() when checkPasswordLoading != null:
return checkPasswordLoading();case CheckPasswordSuccess() when checkPasswordSuccess != null:
return checkPasswordSuccess();case CheckPasswordFailure() when checkPasswordFailure != null:
return checkPasswordFailure(_that.appFailure);case ChangePasswordLoading() when changePasswordLoading != null:
return changePasswordLoading();case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess();case ChangePasswordFailure() when changePasswordFailure != null:
return changePasswordFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  logoutLoading,required TResult Function()  logoutSuccess,required TResult Function( AppFailure appFailure)  logoutFailure,required TResult Function()  checkPasswordLoading,required TResult Function()  checkPasswordSuccess,required TResult Function( AppFailure appFailure)  checkPasswordFailure,required TResult Function()  changePasswordLoading,required TResult Function()  changePasswordSuccess,required TResult Function( AppFailure appFailure)  changePasswordFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ProfileLogoutLoading():
return logoutLoading();case _ProfileLogoutSuccess():
return logoutSuccess();case _ProfileLogoutFailure():
return logoutFailure(_that.appFailure);case CheckPasswordLoading():
return checkPasswordLoading();case CheckPasswordSuccess():
return checkPasswordSuccess();case CheckPasswordFailure():
return checkPasswordFailure(_that.appFailure);case ChangePasswordLoading():
return changePasswordLoading();case ChangePasswordSuccess():
return changePasswordSuccess();case ChangePasswordFailure():
return changePasswordFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  logoutLoading,TResult? Function()?  logoutSuccess,TResult? Function( AppFailure appFailure)?  logoutFailure,TResult? Function()?  checkPasswordLoading,TResult? Function()?  checkPasswordSuccess,TResult? Function( AppFailure appFailure)?  checkPasswordFailure,TResult? Function()?  changePasswordLoading,TResult? Function()?  changePasswordSuccess,TResult? Function( AppFailure appFailure)?  changePasswordFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ProfileLogoutLoading() when logoutLoading != null:
return logoutLoading();case _ProfileLogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case _ProfileLogoutFailure() when logoutFailure != null:
return logoutFailure(_that.appFailure);case CheckPasswordLoading() when checkPasswordLoading != null:
return checkPasswordLoading();case CheckPasswordSuccess() when checkPasswordSuccess != null:
return checkPasswordSuccess();case CheckPasswordFailure() when checkPasswordFailure != null:
return checkPasswordFailure(_that.appFailure);case ChangePasswordLoading() when changePasswordLoading != null:
return changePasswordLoading();case ChangePasswordSuccess() when changePasswordSuccess != null:
return changePasswordSuccess();case ChangePasswordFailure() when changePasswordFailure != null:
return changePasswordFailure(_that.appFailure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class _ProfileLogoutLoading implements ProfileState {
  const _ProfileLogoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLogoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.logoutLoading()';
}


}




/// @nodoc


class _ProfileLogoutSuccess implements ProfileState {
  const _ProfileLogoutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLogoutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.logoutSuccess()';
}


}




/// @nodoc


class _ProfileLogoutFailure implements ProfileState {
  const _ProfileLogoutFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileLogoutFailureCopyWith<_ProfileLogoutFailure> get copyWith => __$ProfileLogoutFailureCopyWithImpl<_ProfileLogoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLogoutFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProfileState.logoutFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class _$ProfileLogoutFailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileLogoutFailureCopyWith(_ProfileLogoutFailure value, $Res Function(_ProfileLogoutFailure) _then) = __$ProfileLogoutFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class __$ProfileLogoutFailureCopyWithImpl<$Res>
    implements _$ProfileLogoutFailureCopyWith<$Res> {
  __$ProfileLogoutFailureCopyWithImpl(this._self, this._then);

  final _ProfileLogoutFailure _self;
  final $Res Function(_ProfileLogoutFailure) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(_ProfileLogoutFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

/// @nodoc


class CheckPasswordLoading implements ProfileState {
  const CheckPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.checkPasswordLoading()';
}


}




/// @nodoc


class CheckPasswordSuccess implements ProfileState {
  const CheckPasswordSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPasswordSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.checkPasswordSuccess()';
}


}




/// @nodoc


class CheckPasswordFailure implements ProfileState {
  const CheckPasswordFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPasswordFailureCopyWith<CheckPasswordFailure> get copyWith => _$CheckPasswordFailureCopyWithImpl<CheckPasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPasswordFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProfileState.checkPasswordFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $CheckPasswordFailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $CheckPasswordFailureCopyWith(CheckPasswordFailure value, $Res Function(CheckPasswordFailure) _then) = _$CheckPasswordFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$CheckPasswordFailureCopyWithImpl<$Res>
    implements $CheckPasswordFailureCopyWith<$Res> {
  _$CheckPasswordFailureCopyWithImpl(this._self, this._then);

  final CheckPasswordFailure _self;
  final $Res Function(CheckPasswordFailure) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(CheckPasswordFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

/// @nodoc


class ChangePasswordLoading implements ProfileState {
  const ChangePasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.changePasswordLoading()';
}


}




/// @nodoc


class ChangePasswordSuccess implements ProfileState {
  const ChangePasswordSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.changePasswordSuccess()';
}


}




/// @nodoc


class ChangePasswordFailure implements ProfileState {
  const ChangePasswordFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordFailureCopyWith<ChangePasswordFailure> get copyWith => _$ChangePasswordFailureCopyWithImpl<ChangePasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProfileState.changePasswordFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordFailureCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ChangePasswordFailureCopyWith(ChangePasswordFailure value, $Res Function(ChangePasswordFailure) _then) = _$ChangePasswordFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$ChangePasswordFailureCopyWithImpl<$Res>
    implements $ChangePasswordFailureCopyWith<$Res> {
  _$ChangePasswordFailureCopyWithImpl(this._self, this._then);

  final ChangePasswordFailure _self;
  final $Res Function(ChangePasswordFailure) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(ChangePasswordFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
