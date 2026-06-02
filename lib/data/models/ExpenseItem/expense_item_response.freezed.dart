// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExpenseItemResponse _$ExpenseItemResponseFromJson(Map<String, dynamic> json) {
  return _ExpenseItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ExpenseItemResponse {
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime? get createdTime => throw _privateConstructorUsedError;

  /// Serializes this ExpenseItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseItemResponseCopyWith<ExpenseItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseItemResponseCopyWith<$Res> {
  factory $ExpenseItemResponseCopyWith(
    ExpenseItemResponse value,
    $Res Function(ExpenseItemResponse) then,
  ) = _$ExpenseItemResponseCopyWithImpl<$Res, ExpenseItemResponse>;
  @useResult
  $Res call({
    String title,
    double amount,
    String category,
    DateTime? createdTime,
  });
}

/// @nodoc
class _$ExpenseItemResponseCopyWithImpl<$Res, $Val extends ExpenseItemResponse>
    implements $ExpenseItemResponseCopyWith<$Res> {
  _$ExpenseItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? category = null,
    Object? createdTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            createdTime: freezed == createdTime
                ? _value.createdTime
                : createdTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExpenseItemResponseImplCopyWith<$Res>
    implements $ExpenseItemResponseCopyWith<$Res> {
  factory _$$ExpenseItemResponseImplCopyWith(
    _$ExpenseItemResponseImpl value,
    $Res Function(_$ExpenseItemResponseImpl) then,
  ) = __$$ExpenseItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    double amount,
    String category,
    DateTime? createdTime,
  });
}

/// @nodoc
class __$$ExpenseItemResponseImplCopyWithImpl<$Res>
    extends _$ExpenseItemResponseCopyWithImpl<$Res, _$ExpenseItemResponseImpl>
    implements _$$ExpenseItemResponseImplCopyWith<$Res> {
  __$$ExpenseItemResponseImplCopyWithImpl(
    _$ExpenseItemResponseImpl _value,
    $Res Function(_$ExpenseItemResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExpenseItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? category = null,
    Object? createdTime = freezed,
  }) {
    return _then(
      _$ExpenseItemResponseImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        createdTime: freezed == createdTime
            ? _value.createdTime
            : createdTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseItemResponseImpl implements _ExpenseItemResponse {
  const _$ExpenseItemResponseImpl({
    required this.title,
    required this.amount,
    required this.category,
    this.createdTime,
  });

  factory _$ExpenseItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseItemResponseImplFromJson(json);

  @override
  final String title;
  @override
  final double amount;
  @override
  final String category;
  @override
  final DateTime? createdTime;

  @override
  String toString() {
    return 'ExpenseItemResponse(title: $title, amount: $amount, category: $category, createdTime: $createdTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseItemResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, amount, category, createdTime);

  /// Create a copy of ExpenseItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseItemResponseImplCopyWith<_$ExpenseItemResponseImpl> get copyWith =>
      __$$ExpenseItemResponseImplCopyWithImpl<_$ExpenseItemResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseItemResponseImplToJson(this);
  }
}

abstract class _ExpenseItemResponse implements ExpenseItemResponse {
  const factory _ExpenseItemResponse({
    required final String title,
    required final double amount,
    required final String category,
    final DateTime? createdTime,
  }) = _$ExpenseItemResponseImpl;

  factory _ExpenseItemResponse.fromJson(Map<String, dynamic> json) =
      _$ExpenseItemResponseImpl.fromJson;

  @override
  String get title;
  @override
  double get amount;
  @override
  String get category;
  @override
  DateTime? get createdTime;

  /// Create a copy of ExpenseItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseItemResponseImplCopyWith<_$ExpenseItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
