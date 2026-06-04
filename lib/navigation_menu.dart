import 'package:flutter/material.dart';
import 'package:ai_expense/l10n/app_localizations.dart';
import 'package:ai_expense/ui/core/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class NavigationMenu extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationMenu({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        elevation: 0,
        height: 64,
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          if (navigationShell.currentIndex == index) {
            return;
          }
          navigationShell.goBranch(index);
        },
        destinations: [
          _buildNavigationItem(theme, Icons.home_rounded, l10n.homeScreen),
          // _buildNavigationItem(theme, Icons.monetization_on_outlined, l10n.expenseScreen),
          // _buildNavigationItem(theme, Icons.bar_chart_rounded, l10n.statisticScreen),
          _buildNavigationItem(theme, Icons.person_rounded, l10n.profileScreen),
        ],
      )
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
