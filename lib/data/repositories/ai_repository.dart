import 'package:ai_expense/domain/models/expense_item_model.dart';
import 'package:ai_expense/data/services/ai_service.dart';
import 'package:ai_expense/utils/utils.dart';

class AIRepository {
  final AIService _aiService;

  AIRepository(this._aiService);

  Future<ExpenseItem> generateExpenseFromInput(String input) async {
    final response = await _aiService.generateExpenseFromInput(input);
    return ExpenseItem(
      expenseItemId: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      title: response.title,
      amount: response.amount,
      category: CategoryUtils.getById(
        response.category,
      ),
      createdTime: DateTime.now(),
    );
  }
}