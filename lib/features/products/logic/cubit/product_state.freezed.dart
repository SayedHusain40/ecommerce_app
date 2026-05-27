// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetProductLoading value)?  getProductLoading,TResult Function( GetProductSuccess value)?  getProductSuccess,TResult Function( GetProductFailure value)?  getProductFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductLoading() when getProductLoading != null:
return getProductLoading(_that);case GetProductSuccess() when getProductSuccess != null:
return getProductSuccess(_that);case GetProductFailure() when getProductFailure != null:
return getProductFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetProductLoading value)  getProductLoading,required TResult Function( GetProductSuccess value)  getProductSuccess,required TResult Function( GetProductFailure value)  getProductFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetProductLoading():
return getProductLoading(_that);case GetProductSuccess():
return getProductSuccess(_that);case GetProductFailure():
return getProductFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetProductLoading value)?  getProductLoading,TResult? Function( GetProductSuccess value)?  getProductSuccess,TResult? Function( GetProductFailure value)?  getProductFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductLoading() when getProductLoading != null:
return getProductLoading(_that);case GetProductSuccess() when getProductSuccess != null:
return getProductSuccess(_that);case GetProductFailure() when getProductFailure != null:
return getProductFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getProductLoading,TResult Function( List<ProductModel> categoriesList)?  getProductSuccess,TResult Function( AppFailure appFailure)?  getProductFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductLoading() when getProductLoading != null:
return getProductLoading();case GetProductSuccess() when getProductSuccess != null:
return getProductSuccess(_that.categoriesList);case GetProductFailure() when getProductFailure != null:
return getProductFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getProductLoading,required TResult Function( List<ProductModel> categoriesList)  getProductSuccess,required TResult Function( AppFailure appFailure)  getProductFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetProductLoading():
return getProductLoading();case GetProductSuccess():
return getProductSuccess(_that.categoriesList);case GetProductFailure():
return getProductFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getProductLoading,TResult? Function( List<ProductModel> categoriesList)?  getProductSuccess,TResult? Function( AppFailure appFailure)?  getProductFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductLoading() when getProductLoading != null:
return getProductLoading();case GetProductSuccess() when getProductSuccess != null:
return getProductSuccess(_that.categoriesList);case GetProductFailure() when getProductFailure != null:
return getProductFailure(_that.appFailure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class GetProductLoading implements ProductState {
  const GetProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.getProductLoading()';
}


}




/// @nodoc


class GetProductSuccess implements ProductState {
  const GetProductSuccess(final  List<ProductModel> categoriesList): _categoriesList = categoriesList;
  

 final  List<ProductModel> _categoriesList;
 List<ProductModel> get categoriesList {
  if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoriesList);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductSuccessCopyWith<GetProductSuccess> get copyWith => _$GetProductSuccessCopyWithImpl<GetProductSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductSuccess&&const DeepCollectionEquality().equals(other._categoriesList, _categoriesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoriesList));

@override
String toString() {
  return 'ProductState.getProductSuccess(categoriesList: $categoriesList)';
}


}

/// @nodoc
abstract mixin class $GetProductSuccessCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetProductSuccessCopyWith(GetProductSuccess value, $Res Function(GetProductSuccess) _then) = _$GetProductSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> categoriesList
});




}
/// @nodoc
class _$GetProductSuccessCopyWithImpl<$Res>
    implements $GetProductSuccessCopyWith<$Res> {
  _$GetProductSuccessCopyWithImpl(this._self, this._then);

  final GetProductSuccess _self;
  final $Res Function(GetProductSuccess) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesList = null,}) {
  return _then(GetProductSuccess(
null == categoriesList ? _self._categoriesList : categoriesList // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class GetProductFailure implements ProductState {
  const GetProductFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductFailureCopyWith<GetProductFailure> get copyWith => _$GetProductFailureCopyWithImpl<GetProductFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProductState.getProductFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $GetProductFailureCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetProductFailureCopyWith(GetProductFailure value, $Res Function(GetProductFailure) _then) = _$GetProductFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$GetProductFailureCopyWithImpl<$Res>
    implements $GetProductFailureCopyWith<$Res> {
  _$GetProductFailureCopyWithImpl(this._self, this._then);

  final GetProductFailure _self;
  final $Res Function(GetProductFailure) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(GetProductFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
