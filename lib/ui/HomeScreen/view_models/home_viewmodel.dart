import 'package:ai_expense/data/repositories/ai_repository.dart';
import 'package:ai_expense/data/services/ai_service.dart';
import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_state.dart';
import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_expense/domain/models/index.dart';

class HomeState {
  final String input;
  final String displayText;
  final List<ExpenseItem> expenses;

  const HomeState({
    this.input = '',
    this.displayText = '',
    this.expenses = const [],
  });

  HomeState copyWith({
    String? input,
    String? displayText,
    List<ExpenseItem>? expenses,
  }) {
    return HomeState(
      input: input ?? this.input,
      displayText: displayText ?? this.displayText,
      expenses: expenses ?? this.expenses,
    );
  }
}

final homeViewModelProvider =
    AutoDisposeStateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);

final aiServiceProvider = Provider<AIService>(
  (ref) => AIService(),
);

final aiRepositoryProvider = Provider<AIRepository>(
  (ref) => AIRepository(ref.read(aiServiceProvider)),
);

final aiExpenseProvider = StateNotifierProvider<AiExpenseViewModel, AiExpenseState>(
  (ref) => AiExpenseViewModel(ref.read(aiRepositoryProvider)),
);

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(): super(const HomeState());

  final TextEditingController inputController = TextEditingController();

  String get input => state.input;
  String get displayText => state.displayText;

  void updateInput(String value) {
    state = state.copyWith(input: value, displayText: value);
  }

  void clearInput() {
    inputController.clear();
    state = state.copyWith(input: '', displayText: '');
  }

  // bool addExpenseFromInput() {
  //   final input = inputController.text.trim();
  //   if (input.isEmpty) {
  //     return false;
  //   }

  //   final parts = input.split(RegExp(r'\s+'));
  //   final lastToken = parts.isNotEmpty ? parts.last : '';
  //   final parsedAmount = int.tryParse(lastToken.replaceAll('.', '').replaceAll(',', ''));

  //   var title = input;
  //   var amount = 0;

  //   if (parsedAmount != null) {
  //     title = parts.sublist(0, parts.length - 1).join(' ').trim();
  //     amount = parsedAmount * 1000;
  //   }

  //   if (title.isEmpty) {
  //     title = 'Chi tiêu';
  //   }

  //   final now = DateTime.now();
  //   final hour = now.hour.toString().padLeft(2, '0');
  //   final minute = now.minute.toString().padLeft(2, '0');

  //   final newItem = ExpenseItem(
  //     expenseItemId: UniqueKey().toString(), // TODO: change to create ID in backend
  //     title: title,
  //     category: _resolveCategory(title),
  //     createdTime: now,
  //     amount: amount,
  //   );

  //   state = state.copyWith(
  //     input: '',
  //     displayText: '',
  //     expenses: [newItem, ...state.expenses],
  //   );
  //   inputController.clear();
  //   return true;
  // }

  String formatAmount(int amount) {
    final absDigits = amount.abs().toString();
    final reversed = absDigits.split('').reversed.toList();
    final chunks = <String>[];

    for (var i = 0; i < reversed.length; i += 3) {
      final end = (i + 3 < reversed.length) ? i + 3 : reversed.length;
      final chunk = reversed.sublist(i, end).reversed.join();
      chunks.add(chunk);
    }

    final formatted = chunks.reversed.join('.');
    return '-$formatted';
  }

  // ItemCategory _resolveCategory(String title) {
  //   final normalized = title.toLowerCase();

  //   if (normalized.contains('an') || normalized.contains('sang') || normalized.contains('trua') || normalized.contains('toi')) {
  //     return ItemCategory(name: 'Ăn uống', iconName: 'fastfood_outlined');
  //   }
  //   if (normalized.contains('xe') || normalized.contains('taxi') || normalized.contains('grab')) {
  //     return ItemCategory(name: 'Di chuyển', iconName: 'directions_car_filled_outlined');
  //   }
  //   if (normalized.contains('cafe') || normalized.contains('tra sua') || normalized.contains('nuoc')) {
  //     return ItemCategory(name: 'Đồ uống', iconName: 'local_cafe_outlined');
  //   }
  //   return ItemCategory(name: 'Khác', iconName: 'receipt_long_outlined');
  // }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}
