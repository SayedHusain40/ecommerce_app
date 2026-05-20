// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetCategoryLoading value)?  getCategoryLoading,TResult Function( GetCategorySuccess value)?  getCategorySuccess,TResult Function( GetCategoryFailure value)?  getCategoryFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetCategoryLoading() when getCategoryLoading != null:
return getCategoryLoading(_that);case GetCategorySuccess() when getCategorySuccess != null:
return getCategorySuccess(_that);case GetCategoryFailure() when getCategoryFailure != null:
return getCategoryFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetCategoryLoading value)  getCategoryLoading,required TResult Function( GetCategorySuccess value)  getCategorySuccess,required TResult Function( GetCategoryFailure value)  getCategoryFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetCategoryLoading():
return getCategoryLoading(_that);case GetCategorySuccess():
return getCategorySuccess(_that);case GetCategoryFailure():
return getCategoryFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetCategoryLoading value)?  getCategoryLoading,TResult? Function( GetCategorySuccess value)?  getCategorySuccess,TResult? Function( GetCategoryFailure value)?  getCategoryFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetCategoryLoading() when getCategoryLoading != null:
return getCategoryLoading(_that);case GetCategorySuccess() when getCategorySuccess != null:
return getCategorySuccess(_that);case GetCategoryFailure() when getCategoryFailure != null:
return getCategoryFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getCategoryLoading,TResult Function( List<CategoryModel> categoriesList)?  getCategorySuccess,TResult Function( AppFailure appFailure)?  getCategoryFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetCategoryLoading() when getCategoryLoading != null:
return getCategoryLoading();case GetCategorySuccess() when getCategorySuccess != null:
return getCategorySuccess(_that.categoriesList);case GetCategoryFailure() when getCategoryFailure != null:
return getCategoryFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getCategoryLoading,required TResult Function( List<CategoryModel> categoriesList)  getCategorySuccess,required TResult Function( AppFailure appFailure)  getCategoryFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetCategoryLoading():
return getCategoryLoading();case GetCategorySuccess():
return getCategorySuccess(_that.categoriesList);case GetCategoryFailure():
return getCategoryFailure(_that.appFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getCategoryLoading,TResult? Function( List<CategoryModel> categoriesList)?  getCategorySuccess,TResult? Function( AppFailure appFailure)?  getCategoryFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetCategoryLoading() when getCategoryLoading != null:
return getCategoryLoading();case GetCategorySuccess() when getCategorySuccess != null:
return getCategorySuccess(_that.categoriesList);case GetCategoryFailure() when getCategoryFailure != null:
return getCategoryFailure(_that.appFailure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class GetCategoryLoading implements CategoryState {
  const GetCategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.getCategoryLoading()';
}


}




/// @nodoc


class GetCategorySuccess implements CategoryState {
  const GetCategorySuccess(final  List<CategoryModel> categoriesList): _categoriesList = categoriesList;
  

 final  List<CategoryModel> _categoriesList;
 List<CategoryModel> get categoriesList {
  if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoriesList);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategorySuccessCopyWith<GetCategorySuccess> get copyWith => _$GetCategorySuccessCopyWithImpl<GetCategorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategorySuccess&&const DeepCollectionEquality().equals(other._categoriesList, _categoriesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoriesList));

@override
String toString() {
  return 'CategoryState.getCategorySuccess(categoriesList: $categoriesList)';
}


}

/// @nodoc
abstract mixin class $GetCategorySuccessCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $GetCategorySuccessCopyWith(GetCategorySuccess value, $Res Function(GetCategorySuccess) _then) = _$GetCategorySuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categoriesList
});




}
/// @nodoc
class _$GetCategorySuccessCopyWithImpl<$Res>
    implements $GetCategorySuccessCopyWith<$Res> {
  _$GetCategorySuccessCopyWithImpl(this._self, this._then);

  final GetCategorySuccess _self;
  final $Res Function(GetCategorySuccess) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesList = null,}) {
  return _then(GetCategorySuccess(
null == categoriesList ? _self._categoriesList : categoriesList // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc


class GetCategoryFailure implements CategoryState {
  const GetCategoryFailure(this.appFailure);
  

 final  AppFailure appFailure;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoryFailureCopyWith<GetCategoryFailure> get copyWith => _$GetCategoryFailureCopyWithImpl<GetCategoryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoryFailure&&(identical(other.appFailure, appFailure) || other.appFailure == appFailure));
}


@override
int get hashCode => Object.hash(runtimeType,appFailure);

@override
String toString() {
  return 'CategoryState.getCategoryFailure(appFailure: $appFailure)';
}


}

/// @nodoc
abstract mixin class $GetCategoryFailureCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $GetCategoryFailureCopyWith(GetCategoryFailure value, $Res Function(GetCategoryFailure) _then) = _$GetCategoryFailureCopyWithImpl;
@useResult
$Res call({
 AppFailure appFailure
});




}
/// @nodoc
class _$GetCategoryFailureCopyWithImpl<$Res>
    implements $GetCategoryFailureCopyWith<$Res> {
  _$GetCategoryFailureCopyWithImpl(this._self, this._then);

  final GetCategoryFailure _self;
  final $Res Function(GetCategoryFailure) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appFailure = null,}) {
  return _then(GetCategoryFailure(
null == appFailure ? _self.appFailure : appFailure // ignore: cast_nullable_to_non_nullable
as AppFailure,
  ));
}


}

// dart format on
