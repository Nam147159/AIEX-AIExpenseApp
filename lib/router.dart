import 'package:ai_expense/navigation_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_expense/ui/LoginScreen/screen/login_screen.dart';
import 'package:ai_expense/ui/HomeScreen/screen/home_screen.dart';
import 'package:ai_expense/ui/ProfileScreen/screen/profile_screen.dart';
import 'package:ai_expense/ui/AddExpenseScreen/screen/add_expense_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/add-expense',
        builder: (context, state) {
          return const AddExpenseScreen();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationMenu(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ]
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) {
                  return const ProfileScreen();
                },
              ),
            ]
          ),
        ]
      )
    ]
  );
});