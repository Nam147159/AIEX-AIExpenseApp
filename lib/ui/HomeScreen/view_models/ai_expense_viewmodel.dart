import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense/data/repositories/ai_repository.dart';

class AiExpenseViewModel extends StateNotifier<AiExpenseState> {
  final AIRepository repository;

  AiExpenseViewModel(
    this.repository,
  ) : super(
          const AiExpenseState(),
        );

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