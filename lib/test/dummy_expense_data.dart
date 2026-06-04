import 'package:ai_expense/domain/models/expense_item_model.dart';
import 'package:ai_expense/domain/models/item_category_model.dart';
import 'package:flutter/foundation.dart';

List<ExpenseItem> buildDummyExpensesForDisplay(ExpenseItem? expense) {
  if (expense == null) {
    return const [];
  }

  if (!kDebugMode) {
    return [expense];
  }

  final now = DateTime.now();
  return [
    ExpenseItem(
      expenseItemId: 'dummy-expense-001',
      title: 'An sang',
      category: ItemCategory(
        itemCategoryId: 'food',
        name: 'An uong',
        iconName: 'fastfood_outlined',
      ),
      createdTime: now.subtract(const Duration(minutes: 12)),
      amount: 45000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-002',
      title: 'Cafe sang',
      category: ItemCategory(
        itemCategoryId: 'drink',
        name: 'Do uong',
        iconName: 'local_cafe_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 1, minutes: 5)),
      amount: 30000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-003',
      title: 'Di Grab',
      category: ItemCategory(
        itemCategoryId: 'transport',
        name: 'Di chuyen',
        iconName: 'directions_car_filled_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 2, minutes: 20)),
      amount: 75000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-004',
      title: 'An trua',
      category: ItemCategory(
        itemCategoryId: 'food',
        name: 'An uong',
        iconName: 'fastfood_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 4)),
      amount: 95000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-005',
      title: 'Mua do dung',
      category: ItemCategory(
        itemCategoryId: 'shopping',
        name: 'Mua sam',
        iconName: 'receipt_long_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 6, minutes: 30)),
      amount: 120000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-005',
      title: 'Mua do dung',
      category: ItemCategory(
        itemCategoryId: 'shopping',
        name: 'Mua sam',
        iconName: 'receipt_long_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 6, minutes: 30)),
      amount: 120000,
    ),
    ExpenseItem(
      expenseItemId: 'dummy-expense-005',
      title: 'Mua do dung',
      category: ItemCategory(
        itemCategoryId: 'shopping',
        name: 'Mua sam',
        iconName: 'receipt_long_outlined',
      ),
      createdTime: now.subtract(const Duration(hours: 6, minutes: 30)),
      amount: 120000,
    ),
  ];
}
