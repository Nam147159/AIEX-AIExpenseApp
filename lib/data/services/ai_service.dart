import 'dart:convert';
import 'package:ai_expense/data/models/ExpenseItem/expense_item_response.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class AIService {
  final model = GenerativeModel(
    model: 'models/gemini-2.5-flash',
    apiKey: dotenv.env['GOOGLE_API_KEY']!,
  );

  Future<ExpenseItemResponse> generateExpenseFromInput(String input) async {
    final prompt = '''
      Extract expense information.

      Categories:
      - Food
      - Transport
      - Shopping
      - Entertainment
      - Salary
      - Other

      Return JSON only.

      {
        "title": "",
        "amount": 0,
        "category": "",
        "createdTime": null
      }

      Input:
      $input
      ''';
    final response = await model.generateContent([Content.text(prompt)]);
    final content = response.text;

    if (content == null || content.isEmpty) {
      throw Exception('No response from AI');
    }

    final cleanedJson = _extractJson(content);
    debugPrint('========== PROMPT ==========');
    debugPrint(prompt);
    debugPrint('========== RAW RESPONSE ==========');
    debugPrint(content);
    debugPrint('========== CLEANED JSON ==========');
    debugPrint(cleanedJson);
    final json = jsonDecode(cleanedJson) as Map<String, dynamic>;
    return ExpenseItemResponse.fromJson(json);
  }

  String _extractJson(String raw) {
    final trimmed = raw.trim();

    if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
      return trimmed;
    }

    final fenceMatch = RegExp(r'```(?:json)?\s*([\s\S]*?)\s*```', caseSensitive: false)
        .firstMatch(trimmed);
    if (fenceMatch != null) {
      final fencedContent = (fenceMatch.group(1) ?? '').trim();
      if (fencedContent.startsWith('{') && fencedContent.endsWith('}')) {
        return fencedContent;
      }
    }

    final start = trimmed.indexOf('{');
    final end = trimmed.lastIndexOf('}');
    if (start != -1 && end != -1 && end > start) {
      return trimmed.substring(start, end + 1);
    }

    throw const FormatException('AI response does not contain valid JSON');
  }
}