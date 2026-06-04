import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_state.dart';
import 'package:ai_expense/domain/models/expense_item_model.dart';
import 'package:ai_expense/domain/models/item_category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense/data/repositories/ai_repository.dart';

class AiExpenseViewModel extends StateNotifier<AiExpenseState> {
  final AIRepository repository;

  AiExpenseViewModel(
    this.repository,
  ) : super(_initialState());

  static AiExpenseState _initialState() {
    if (!kDebugMode) {
      return const AiExpenseState();
    }

    return AiExpenseState(
      expense: ExpenseItem(
        expenseItemId: 'dummy-expense-001',
        title: 'An sang',
        category: ItemCategory(
          itemCategoryId: 'food',
          name: 'An uong',
          iconName: 'fastfood_outlined',
        ),
        createdTime: DateTime.now(),
        amount: 45000,
      ),
    );
  }

  Future<void> analyze(
    String input,
  ) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );

    try {
      final expense =
          await repository.generateExpenseFromInput(
        input,
      );

      state = state.copyWith(
        isLoading: false,
        expense: expense,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}