import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/expense_item_model.dart';

part 'ai_expense_state.freezed.dart';

@freezed
class AiExpenseState with _$AiExpenseState {
  const factory AiExpenseState({
    @Default(false) bool isLoading,
    ExpenseItem? expense,
    String? errorMessage,
  }) = _AiExpenseState;
}