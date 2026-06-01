import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  bool addExpenseFromInput() {
    final input = inputController.text.trim();
    if (input.isEmpty) {
      return false;
    }

    final parts = input.split(RegExp(r'\s+'));
    final lastToken = parts.isNotEmpty ? parts.last : '';
    final parsedAmount = int.tryParse(lastToken.replaceAll('.', '').replaceAll(',', ''));

    var title = input;
    var amount = 0;

    if (parsedAmount != null) {
      title = parts.sublist(0, parts.length - 1).join(' ').trim();
      amount = parsedAmount * 1000;
    }

    if (title.isEmpty) {
      title = 'Chi tiêu';
    }

    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');

    final newItem = ExpenseItem(
      title: title,
      category: _resolveCategory(title),
      time: '$hour:$minute',
      amount: amount,
      icon: _resolveExpenseIcon(title),
    );

    state = state.copyWith(
      input: '',
      displayText: '',
      expenses: [newItem, ...state.expenses],
    );
    inputController.clear();
    return true;
  }

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

  String _resolveCategory(String title) {
    final normalized = title.toLowerCase();

    if (normalized.contains('an') || normalized.contains('sang') || normalized.contains('trua') || normalized.contains('toi')) {
      return 'Ăn uống';
    }
    if (normalized.contains('xe') || normalized.contains('taxi') || normalized.contains('grab')) {
      return 'Di chuyển';
    }
    if (normalized.contains('cafe') || normalized.contains('tra sua') || normalized.contains('nuoc')) {
      return 'Đồ uống';
    }
    return 'Khác';
  }

  IconData _resolveExpenseIcon(String title) {
    final normalized = title.toLowerCase();

    if (normalized.contains('an') || normalized.contains('sang') || normalized.contains('trua') || normalized.contains('toi')) {
      return Icons.fastfood_outlined;
    }
    if (normalized.contains('xe') || normalized.contains('taxi') || normalized.contains('grab')) {
      return Icons.directions_car_filled_outlined;
    }
    if (normalized.contains('cafe') || normalized.contains('tra sua') || normalized.contains('nuoc')) {
      return Icons.local_cafe_outlined;
    }
    return Icons.receipt_long_outlined;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}

class ExpenseItem {
  const ExpenseItem({
    required this.title,
    required this.category,
    required this.time,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String category;
  final String time;
  final int amount;
  final IconData icon;
}
