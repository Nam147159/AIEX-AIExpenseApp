// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_expense_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AiExpenseState {
  bool get isLoading => throw _privateConstructorUsedError;
  ExpenseItem? get expense => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AiExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiExpenseStateCopyWith<AiExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiExpenseStateCopyWith<$Res> {
  factory $AiExpenseStateCopyWith(
    AiExpenseState value,
    $Res Function(AiExpenseState) then,
  ) = _$AiExpenseStateCopyWithImpl<$Res, AiExpenseState>;
  @useResult
  $Res call({bool isLoading, ExpenseItem? expense, String? errorMessage});
}

/// @nodoc
class _$AiExpenseStateCopyWithImpl<$Res, $Val extends AiExpenseState>
    implements $AiExpenseStateCopyWith<$Res> {
  _$AiExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? expense = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            expense: freezed == expense
                ? _value.expense
                : expense // ignore: cast_nullable_to_non_nullable
                      as ExpenseItem?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiExpenseStateImplCopyWith<$Res>
    implements $AiExpenseStateCopyWith<$Res> {
  factory _$$AiExpenseStateImplCopyWith(
    _$AiExpenseStateImpl value,
    $Res Function(_$AiExpenseStateImpl) then,
  ) = __$$AiExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, ExpenseItem? expense, String? errorMessage});
}

/// @nodoc
class __$$AiExpenseStateImplCopyWithImpl<$Res>
    extends _$AiExpenseStateCopyWithImpl<$Res, _$AiExpenseStateImpl>
    implements _$$AiExpenseStateImplCopyWith<$Res> {
  __$$AiExpenseStateImplCopyWithImpl(
    _$AiExpenseStateImpl _value,
    $Res Function(_$AiExpenseStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? expense = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$AiExpenseStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        expense: freezed == expense
            ? _value.expense
            : expense // ignore: cast_nullable_to_non_nullable
                  as ExpenseItem?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AiExpenseStateImpl implements _AiExpenseState {
  const _$AiExpenseStateImpl({
    this.isLoading = false,
    this.expense,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ExpenseItem? expense;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AiExpenseState(isLoading: $isLoading, expense: $expense, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiExpenseStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, expense, errorMessage);

  /// Create a copy of AiExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiExpenseStateImplCopyWith<_$AiExpenseStateImpl> get copyWith =>
      __$$AiExpenseStateImplCopyWithImpl<_$AiExpenseStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AiExpenseState implements AiExpenseState {
  const factory _AiExpenseState({
    final bool isLoading,
    final ExpenseItem? expense,
    final String? errorMessage,
  }) = _$AiExpenseStateImpl;

  @override
  bool get isLoading;
  @override
  ExpenseItem? get expense;
  @override
  String? get errorMessage;

  /// Create a copy of AiExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiExpenseStateImplCopyWith<_$AiExpenseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
