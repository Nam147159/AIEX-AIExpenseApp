import 'package:ai_expense/ui/HomeScreen/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/themes/app_colors.dart';
import '../../core/ui/text_field.dart';
import '../view_models/login_viewmodel.dart';
import 'package:ai_expense/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];
    final loginState = ref.watch(loginViewModelProvider);
    final viewModel = ref.read(loginViewModelProvider.notifier);

    ref.listen(loginViewModelProvider, (previous, next) {
        if (next.successMessage != null) {
          context.go('/home');
        }
      });

    return Scaffold(
      backgroundColor: gradientColors.first,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(theme),
                      const SizedBox(height: 32),
                      AppTextField(
                        label: 'Email',
                        hintText: 'email@example.com',
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      AppTextField(
                        label: 'Mật khẩu',
                        hintText: '••••••••',
                        controller: viewModel.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 18),
                      _buildActionRow(theme),
                      const SizedBox(height: 24),
                      _buildLoginButton(theme, loginState, viewModel),
                      const SizedBox(height: 20),
                      _buildFooter(theme),
                      if (loginState.errorMessage != null) 
                        Text(loginState.errorMessage!, style: const TextStyle(color: Colors.red)),
                      if (loginState.successMessage != null)
                        Text(loginState.successMessage!, style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      children: [
        Container(
          width: 86,
          height: 86,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColors.gradientColorStart, AppColors.gradientColorEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.appTitle,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F1F40),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Quản lý chi tiêu thông minh với AI',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF667085),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow(ThemeData theme) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(
                value: _rememberMe,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                activeColor: const Color(0xFF5B7DFF),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _rememberMe = value);
                },
              ),
              Expanded(
                child: Text(
                  l10n.rememberLogin,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF344054),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF5B7DFF),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
          child: const Text('Quên mật khẩu?'),
        ),
      ],
    );
  }

  Widget _buildLoginButton(ThemeData theme, LoginState loginState, LoginViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loginState.isLoading ? null : viewModel.login,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4B6AF3), Color(0xFF8F5BFF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Container(
            alignment: Alignment.center,
            height: 56,
            child: Text(
              'Đăng nhập',
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Chưa có tài khoản? ',
          style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Đăng ký ngay',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF4B6AF3),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
