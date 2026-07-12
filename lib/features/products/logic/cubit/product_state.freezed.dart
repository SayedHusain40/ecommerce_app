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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ProductsLoading value)?  loading,TResult Function( ProductsSuccess value)?  success,TResult Function( ProductsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ProductsLoading() when loading != null:
return loading(_that);case ProductsSuccess() when success != null:
return success(_that);case ProductsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ProductsLoading value)  loading,required TResult Function( ProductsSuccess value)  success,required TResult Function( ProductsFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ProductsLoading():
return loading(_that);case ProductsSuccess():
return success(_that);case ProductsFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ProductsLoading value)?  loading,TResult? Function( ProductsSuccess value)?  success,TResult? Function( ProductsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ProductsLoading() when loading != null:
return loading(_that);case ProductsSuccess() when success != null:
return success(_that);case ProductsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> products)?  success,TResult Function( AppFailure appFailure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ProductsLoading() when loading != null:
return loading();case ProductsSuccess() when success != null:
return success(_that.products);case ProductsFailure() when failure != null:
return failure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> products)  success,required TResult Function( AppFailure appFailure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ProductsLoading():
return loading();case ProductsSuccess():
return success(_that.products);case ProductsFailure():
return failure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> products)?  success,TResult? Function( AppFailure appFailure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ProductsLoading() when loading != null:
return loading();case ProductsSuccess() when success != null:
return success(_that.products);case ProductsFailure() when failure != null:
return failure(_that.appFailure);case _:
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


class ProductsLoading implements ProductState {
  const ProductsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class ProductsSuccess implements ProductState {
  const ProductsSuccess(final  List<ProductModel> products): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsSuccessCopyWith<ProductsSuccess> get copyWith => _$ProductsSuccessCopyWithImpl<ProductsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsSuccess&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'ProductState.success(products: $products)';
}


}

/// @nodoc
abstract mixin class $ProductsSuccessCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductsSuccessCopyWith(ProductsSuccess value, $Res Function(ProductsSuccess) _then) = _$ProductsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products
});




}
/// @nodoc
class _$ProductsSuccessCopyWithImpl<$Res>
    implements $ProductsSuccessCopyWith<$Res> {
  _$ProductsSuccessCopyWithImpl(this._self, this._then);

  final ProductsSuccess _self;
  final $Res Function(ProductsSuccess) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(ProductsSuccess(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class ProductsFailure implements ProductState {
  const ProductsFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsFailureCopyWith<ProductsFailure> get copyWith => _$ProductsFailureCopyWithImpl<ProductsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'ProductState.failure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $ProductsFailureCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductsFailureCopyWith(ProductsFailure value, $Res Function(ProductsFailure) _then) = _$ProductsFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$ProductsFailureCopyWithImpl<$Res>
    implements $ProductsFailureCopyWith<$Res> {
  _$ProductsFailureCopyWithImpl(this._self, this._then);

  final ProductsFailure _self;
  final $Res Function(ProductsFailure) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(ProductsFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
