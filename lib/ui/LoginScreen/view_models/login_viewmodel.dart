import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.successMessage
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? successMessage
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage
    );
  }
}

final loginViewModelProvider =
    AutoDisposeStateNotifierProvider<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(): super(const LoginState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? get errorMessage => state.errorMessage;
  String? get successMessage => state.successMessage;
  bool get isLoading => state.isLoading;

  // Dữ liệu người dùng mẫu (hardcoded)
  final String _testEmail = 'user@gmail.com';
  final String _testPassword = '1234';

  void login() {
    state = state.copyWith(isLoading: true, errorMessage: null, successMessage: null);

    final String email = emailController.text.trim();
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Vui lòng nhập email và mật khẩu'
      );
      return;
    }

    if (!_isValidEmail(email)) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Email không hợp lệ'
      );
      return;
    }

    if (email == _testEmail && password == _testPassword) {
      state = state.copyWith(
        isLoading: false,
        successMessage: 'Đăng nhập thành công!'
      );
      
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Email hoặc mật khẩu không chính xác'
      );
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void clearMessages() {
    state = state.copyWith(errorMessage: null, successMessage: null);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}