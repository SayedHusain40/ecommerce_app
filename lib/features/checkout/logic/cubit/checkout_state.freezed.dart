// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SuccessShipping value)?  successShipping,TResult Function( SuccessPayment value)?  successPayment,TResult Function( SuccessReview value)?  successReview,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SuccessShipping() when successShipping != null:
return successShipping(_that);case SuccessPayment() when successPayment != null:
return successPayment(_that);case SuccessReview() when successReview != null:
return successReview(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SuccessShipping value)  successShipping,required TResult Function( SuccessPayment value)  successPayment,required TResult Function( SuccessReview value)  successReview,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SuccessShipping():
return successShipping(_that);case SuccessPayment():
return successPayment(_that);case SuccessReview():
return successReview(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SuccessShipping value)?  successShipping,TResult? Function( SuccessPayment value)?  successPayment,TResult? Function( SuccessReview value)?  successReview,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SuccessShipping() when successShipping != null:
return successShipping(_that);case SuccessPayment() when successPayment != null:
return successPayment(_that);case SuccessReview() when successReview != null:
return successReview(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  successShipping,TResult Function()?  successPayment,TResult Function()?  successReview,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SuccessShipping() when successShipping != null:
return successShipping();case SuccessPayment() when successPayment != null:
return successPayment();case SuccessReview() when successReview != null:
return successReview();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  successShipping,required TResult Function()  successPayment,required TResult Function()  successReview,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SuccessShipping():
return successShipping();case SuccessPayment():
return successPayment();case SuccessReview():
return successReview();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  successShipping,TResult? Function()?  successPayment,TResult? Function()?  successReview,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SuccessShipping() when successShipping != null:
return successShipping();case SuccessPayment() when successPayment != null:
return successPayment();case SuccessReview() when successReview != null:
return successReview();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckoutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class SuccessShipping implements CheckoutState {
  const SuccessShipping();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessShipping);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.successShipping()';
}


}




/// @nodoc


class SuccessPayment implements CheckoutState {
  const SuccessPayment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessPayment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.successPayment()';
}


}




/// @nodoc


class SuccessReview implements CheckoutState {
  const SuccessReview();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessReview);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.successReview()';
}


}




// dart format on
