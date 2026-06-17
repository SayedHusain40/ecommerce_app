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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetProductsLoading value)?  getProductsLoading,TResult Function( GetProductsSuccess value)?  getProductSuccess,TResult Function( GetProductsFailure value)?  getProductsFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductsLoading() when getProductsLoading != null:
return getProductsLoading(_that);case GetProductsSuccess() when getProductSuccess != null:
return getProductSuccess(_that);case GetProductsFailure() when getProductsFailure != null:
return getProductsFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetProductsLoading value)  getProductsLoading,required TResult Function( GetProductsSuccess value)  getProductSuccess,required TResult Function( GetProductsFailure value)  getProductsFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetProductsLoading():
return getProductsLoading(_that);case GetProductsSuccess():
return getProductSuccess(_that);case GetProductsFailure():
return getProductsFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetProductsLoading value)?  getProductsLoading,TResult? Function( GetProductsSuccess value)?  getProductSuccess,TResult? Function( GetProductsFailure value)?  getProductsFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductsLoading() when getProductsLoading != null:
return getProductsLoading(_that);case GetProductsSuccess() when getProductSuccess != null:
return getProductSuccess(_that);case GetProductsFailure() when getProductsFailure != null:
return getProductsFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getProductsLoading,TResult Function( List<ProductModel> categoriesList)?  getProductSuccess,TResult Function( AppFailure appFailure)?  getProductsFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductsLoading() when getProductsLoading != null:
return getProductsLoading();case GetProductsSuccess() when getProductSuccess != null:
return getProductSuccess(_that.categoriesList);case GetProductsFailure() when getProductsFailure != null:
return getProductsFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getProductsLoading,required TResult Function( List<ProductModel> categoriesList)  getProductSuccess,required TResult Function( AppFailure appFailure)  getProductsFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetProductsLoading():
return getProductsLoading();case GetProductsSuccess():
return getProductSuccess(_that.categoriesList);case GetProductsFailure():
return getProductsFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getProductsLoading,TResult? Function( List<ProductModel> categoriesList)?  getProductSuccess,TResult? Function( AppFailure appFailure)?  getProductsFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductsLoading() when getProductsLoading != null:
return getProductsLoading();case GetProductsSuccess() when getProductSuccess != null:
return getProductSuccess(_that.categoriesList);case GetProductsFailure() when getProductsFailure != null:
return getProductsFailure(_that.appFailure);case _:
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


class GetProductsLoading implements ProductState {
  const GetProductsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.getProductsLoading()';
}


}




/// @nodoc


class GetProductsSuccess implements ProductState {
  const GetProductsSuccess(final  List<ProductModel> categoriesList): _categoriesList = categoriesList;
  

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
$GetProductsSuccessCopyWith<GetProductsSuccess> get copyWith => _$GetProductsSuccessCopyWithImpl<GetProductsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsSuccess&&const DeepCollectionEquality().equals(other._categoriesList, _categoriesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoriesList));

@override
String toString() {
  return 'ProductState.getProductSuccess(categoriesList: $categoriesList)';
}


}

/// @nodoc
abstract mixin class $GetProductsSuccessCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetProductsSuccessCopyWith(GetProductsSuccess value, $Res Function(GetProductsSuccess) _then) = _$GetProductsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> categoriesList
});




}
/// @nodoc
class _$GetProductsSuccessCopyWithImpl<$Res>
    implements $GetProductsSuccessCopyWith<$Res> {
  _$GetProductsSuccessCopyWithImpl(this._self, this._then);

  final GetProductsSuccess _self;
  final $Res Function(GetProductsSuccess) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesList = null,}) {
  return _then(GetProductsSuccess(
null == categoriesList ? _self._categoriesList : categoriesList // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class GetProductsFailure implements ProductState {
  const GetProductsFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsFailureCopyWith<GetProductsFailure> get copyWith => _$GetProductsFailureCopyWithImpl<GetProductsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProductState.getProductsFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $GetProductsFailureCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetProductsFailureCopyWith(GetProductsFailure value, $Res Function(GetProductsFailure) _then) = _$GetProductsFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$GetProductsFailureCopyWithImpl<$Res>
    implements $GetProductsFailureCopyWith<$Res> {
  _$GetProductsFailureCopyWithImpl(this._self, this._then);

  final GetProductsFailure _self;
  final $Res Function(GetProductsFailure) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(GetProductsFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
