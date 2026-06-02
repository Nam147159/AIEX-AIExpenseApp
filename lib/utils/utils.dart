import 'package:flutter/material.dart';
import 'package:ai_expense/domain/models/item_category_model.dart';

class IconUtils {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'fastfood_outlined':
        return Icons.fastfood_outlined;
      case 'directions_car_filled_outlined':
        return Icons.directions_car_filled_outlined;
      case 'local_cafe_outlined':
        return Icons.local_cafe_outlined;
      case 'receipt_long_outlined':
        return Icons.receipt_long_outlined;
      default:
        return Icons.help_outline;
    }
  }
}

class CategoryUtils {
  static final List<ItemCategory>
      categories = [
    ItemCategory(
      itemCategoryId: 'food',
      name: 'Ăn uống',
      iconName: 'restaurant',
    ),
    ItemCategory(
      itemCategoryId: 'transport',
      name: 'Di chuyển',
      iconName: 'directions_car',
    ),
    ItemCategory(
      itemCategoryId: 'shopping',
      name: 'Mua sắm',
      iconName: 'shopping_cart',
    ),
    ItemCategory(
      itemCategoryId: 'other',
      name: 'Khác',
      iconName: 'category',
    ),
  ];

  static ItemCategory getById(
    String itemCategoryId,
  ) {
    return categories.firstWhere(
      (e) => e.itemCategoryId == itemCategoryId,
      orElse: () => categories.last,
    );
  }
}