import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_item_response.freezed.dart';
part 'expense_item_response.g.dart';

@freezed
class ExpenseItemResponse with _$ExpenseItemResponse {
  const factory ExpenseItemResponse({
    required String title,
    required double amount,
    required String category,
    DateTime? createdTime,
  }) = _ExpenseItemResponse;

  factory ExpenseItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseItemResponseFromJson(json);
}