import 'dart:math' as math;
import 'package:ai_expense/ui/HomeScreen/view_models/ai_expense_state.dart';
import 'package:ai_expense/ui/HomeScreen/view_models/home_viewmodel.dart';
import 'package:ai_expense/ui/core/ui/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/themes/app_colors.dart';
import 'package:ai_expense/l10n/app_localizations.dart';
import 'package:ai_expense/domain/models/index.dart';
import 'package:ai_expense/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final aiState = ref.watch(aiExpenseProvider);

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
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomBar(theme),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
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

                  const SizedBox(height: 20)
                ],
              )
            ),

            _buildExpenseInput(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chi tiêu hôm nay",
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: aiState.expense == null
                    ? Center(
                        child: Text(
                          'Chưa có chi tiêu nào',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF98A2B3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ScrollConfiguration(
                        behavior: const _NoStretchScrollBehavior(),
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                          itemCount: aiState.expense == null ? 0 : 1,
                          separatorBuilder: (_, _) => const SizedBox(height: 10),
                          itemBuilder: (context, index) => _buildExpenseCard(theme, aiState.expense!, viewModel),
                        ),
                      ),
              ),
            ),
          ],
        ),
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
    final aiState = ref.watch(aiExpenseProvider);

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
                viewModel.formatAmount(aiState.expense!.amount.toInt()),
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
  
  Widget _buildBottomBar(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: NavigationBar(
        selectedIndex: _selectedIndex,
        elevation: 0,
        height: 64,
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          _buildNavigationItem(theme, Icons.home_rounded, l10n.homePage),
          _buildNavigationItem(theme, Icons.monetization_on_outlined, l10n.expensePage),
          _buildNavigationItem(theme, Icons.bar_chart_rounded, l10n.statisticPage),
          _buildNavigationItem(theme, Icons.person_rounded, l10n.personalPage),
        ],
      ),
    );  
  }

  Widget _buildNavigationItem(ThemeData theme, IconData icon, String label) {
    return NavigationDestination(
      icon: Icon(
        icon,
        size: 24,
        color: const Color(0xFF98A2B3),
      ),
      selectedIcon: Icon(
        icon,
        size: 24,
        color: AppColors.gradientColorStart,
      ),
      label: label,
    );
  }
}

class _NoStretchScrollBehavior extends MaterialScrollBehavior {
  const _NoStretchScrollBehavior();

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
