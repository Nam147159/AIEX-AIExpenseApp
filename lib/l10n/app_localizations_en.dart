// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Expense Management AIEX';

  @override
  String get appSubtitle => 'Smart expense management with AI';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get rememberLogin => 'Remember me';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get homePage => 'Home';

  @override
  String get expensePage => 'Expense';

  @override
  String get statisticPage => 'Statistic';

  @override
  String get personalPage => 'Personal';
}
