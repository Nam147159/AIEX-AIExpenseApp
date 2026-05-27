import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';
// import '../../core/ui/text_field.dart';
import 'package:ai_expense/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onNavItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];

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

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildTotalExpenseCard(theme),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -60,
                      child: _buildExpenseInput(),
                    )
                  ],
                ),

                const SizedBox(height: 28)
              ],
            )
          ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: const SizedBox.shrink(),
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
          // Row hiển thị phần trăm tăng giảm
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
          const SizedBox(height: 5), // Chừa khoảng trống bên trong đáy để không bị thanh input đè chữ
        ],
      ),
    );
  }

  Widget _buildExpenseInput() {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4), // Đổ bóng nhẹ xuống dưới cho thật mắt
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.grey),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Nhập chi tiêu, vd: "ăn sáng 3"',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none, // Ẩn đường gạch chân mặc định của TextField
              ),
            ),
          ),
          // Nút gửi có màu Gradient tròn bo góc vuông nhỏ
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2575FC), Color(0xFF6A11CB)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.send_outlined, color: Colors.white, size: 18),
              onPressed: () {},
            ),
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
        elevation: 0,
        height: 64,
        backgroundColor: Colors.white,
        destinations: [
          _buildNavigationItem(theme, Icons.home_rounded, l10n.homePage, 0),
          _buildNavigationItem(theme, Icons.bar_chart_rounded, l10n.statisticPage, 1),
          _buildNavigationItem(theme, Icons.person_rounded, l10n.personalPage, 2),
        ],
      ),
    );  
  }

  Widget _buildNavigationItem(ThemeData theme, IconData icon, String label, int index) {
    final selected = _selectedIndex == index;

    return InkWell(
      onTap: () => _onNavItemTap(index),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: selected ? AppColors.gradientColorStart : const Color(0xFF98A2B3),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: selected ? AppColors.gradientColorStart : const Color(0xFF98A2B3),
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
