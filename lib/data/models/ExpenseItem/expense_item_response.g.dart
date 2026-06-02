// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseItemResponseImpl _$$ExpenseItemResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ExpenseItemResponseImpl(
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  category: json['category'] as String,
  createdTime: json['createdTime'] == null
      ? null
      : DateTime.parse(json['createdTime'] as String),
);

Map<String, dynamic> _$$ExpenseItemResponseImplToJson(
  _$ExpenseItemResponseImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'amount': instance.amount,
  'category': instance.category,
  'createdTime': instance.createdTime?.toIso8601String(),
};
