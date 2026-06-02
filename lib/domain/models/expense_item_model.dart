import 'package:ai_expense/domain/models/item_category_model.dart';

class ExpenseItem {
  final String expenseItemId;
  final String title;
  final ItemCategory category;
  final DateTime createdTime;
  final double amount;

  const ExpenseItem({
    required this.expenseItemId,
    required this.title,
    required this.category,
    required this.createdTime,
    required this.amount,
  });
}