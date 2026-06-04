import 'dart:math' as math;
import 'package:ai_expense/test/dummy_expense_data.dart';
import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_state.dart';
import 'package:ai_expense/ui/HomeScreen/view_models/home_viewmodel.dart';
import 'package:ai_expense/ui/core/ui/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/themes/app_colors.dart';
import 'package:ai_expense/domain/models/index.dart';
import 'package:ai_expense/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final aiState = ref.watch(aiExpenseProvider);
    final expensesForDisplay = buildDummyExpensesForDisplay(aiState.expense);

    ref.listen<AiExpenseState>(aiExpenseProvider, (previous, next) {
      final hasNewError =
          next.errorMessage != null && next.errorMessage != previous?.errorMessage;
      if (hasNewError) {
        debugPrint('AI analyze error: ${next.errorMessage}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'Phan tich that bai. Vui long thu lai.'),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).padding.top + 20,
                20,
                0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  _buildHeaderRow(theme),

                  const SizedBox(height: 20),

                  _buildTotalExpenseCard(theme),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFF6F7F8),
              child: Column(
                children: [
                  _buildExpenseInput(),

                  const SizedBox(height: 15),

                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF6F7F8),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: ScrollConfiguration(
                        behavior: const NoStretchScrollBehavior(),
                        child: CustomScrollView(
                          physics: const ClampingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Chi tiêu hôm nay',
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SliverToBoxAdapter(child: SizedBox(height: 10)),
                            if (expensesForDisplay.isEmpty)
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Center(
                                  child: Text(
                                    'Chưa có chi tiêu nào',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0xFF98A2B3),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            else
                              SliverPadding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: index == expensesForDisplay.length - 1 ? 0 : 10,
                                        ),
                                        child: _buildExpenseCard(
                                          theme,
                                          expensesForDisplay[index],
                                          viewModel,
                                        ),
                                      );
                                    },
                                    childCount: expensesForDisplay.length,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xin chào!',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Quản lý chi tiêu',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            // TODO: Add functionality later
          }, 
          icon: const Icon(
            Icons.calendar_today_outlined,
            size: 24,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.1),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
        )
      ],
    );
  }

  Widget _buildTotalExpenseCard(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12), 
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tổng chi tiêu hôm nay',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            '480.000 VNĐ',
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.trending_down, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(
                '+12% so với hôm qua',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildExpenseInput() {
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];
    final viewModel = ref.read(homeViewModelProvider.notifier);
    
    return Container(
      height: 65,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: AppTextField(
              label: null,
              hintText: 'Nhập chi tiêu, vd: "ăn sáng 3"',
              controller: viewModel.inputController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
            )
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.mic_none_outlined, color: Colors.white, size: 20),
              onPressed: () {
              }
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: ref.watch(aiExpenseProvider).isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Transform.rotate(
                      angle: -math.pi / 4,
                      child: const Icon(Icons.send_outlined, color: Colors.white, size: 20),
                    ),
              onPressed: () async {
                final input = viewModel.inputController.text.trim();

                if (input.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vui long nhap noi dung chi tieu'),
                    ),
                  );
                  return;
                }

                if (ref.read(aiExpenseProvider).isLoading) {
                  return;
                }

                await ref.read(aiExpenseProvider.notifier).analyze(input);

                final latestState = ref.read(aiExpenseProvider);
                if (latestState.errorMessage == null && mounted) {
                  viewModel.clearInput();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseCard(ThemeData theme, ExpenseItem expense, HomeViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8EBF0),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE9F2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              IconUtils.getIcon(expense.category.iconName),
              size: 20,
              color: const Color(0xFF3B82F6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  expense.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF101828),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${expense.category.name} • ${expense.createdTime.hour.toString().padLeft(2, '0')}:${expense.createdTime.minute.toString().padLeft(2, '0')}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF667085),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                viewModel.formatAmount(expense.amount.toInt()),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFFFF2B2B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'VNĐ',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: const Color(0xFF667085),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
