# Flutter Project Rules

## Tech Stack & Versions
- Flutter 3.22+ and Dart 3.4+
- State Management: Riverpod
- Navigation: go_router
- Networking: dio
- Code Generation: freezed, json_serializable

## Coding Standards
- Always use `const` constructors where possible.
- Use `final` for variables that are not reassigned.
- Prefer `arrow functions` for short, single-expression methods.
- Extract reusable or complex widgets into separate files.
- Small private widgets can remain in the same file.
- Keep widget build methods small and readable
- Private members must start with an underscore `_`.
- Do not generate unnecessary boilerplate.
- Prefer simple and maintainable solutions over over-engineered abstractions.
- Do not use depricated member

## Naming Conventions
- File names must use snake_case.
- Class names must use PascalCase.
- Variables and methods must use camelCase.
- Provider names should end with `provider`.
- View model names should end with `viewmodel`.
- Repository implementation names should end with `Repository`.
- DTO classes should end with `Dto`.

## Project Structure
Follow this folder structure for features:

lib/
  ui/
    core/
      themes/
      widgets/
      responsive/
    [feature_name]/
      view_models/
      widgets/
      screens/

  domain/
    models/

  data/
    repositories/
    services/
    models/

  routing/
  config/
  utils/

## UI Guidelines
- Use Material 3 as a primary design system.
- All colors and text styles must reference `Theme.of(context)`.
- Support Dark Mode and Light Mode in every UI suggestion.
- Avoid hardcoded colors, spacing, or text styles.
- Use Theme extensions for custom design tokens.
- Use consistent spacing values across the app.
- UI must be responsive using `LayoutBuilder` or a custom `Responsive` utility.
- UI must work on mobile, tablet layouts.
- Avoid fixed-width layouts whenever possible.

## Riverpod
- Use Riverpod code generation with `@riverpod` where possible.
- Prefer `AsyncNotifier` for asynchronous state.
- Avoid `ChangeNotifier` unless necessary.
- Providers must not contain UI logic.
- Use `ref.watch()` in UI and `ref.read()` for actions.

## ViewModel Pattern
- Every screen must have a corresponding ViewModel using `@riverpod` code generation.
- ViewModels must extend `AsyncNotifier<T>` for async state or `Notifier<T>` for sync state.
- ViewModels must not import Flutter UI packages (no `BuildContext`, no widgets).
- State must be a `freezed` class when it contains multiple fields.
- All user actions must be exposed as public methods on the ViewModel.
- ViewModels must not call other ViewModels directly; use repositories or services instead.
- Example naming: `LoginScreen` → `LoginViewModel` → `loginViewModelProvider`

## Async State
- Use `AsyncValue` for async UI states.
- Explicitly handle loading, error, and data states.
- Avoid nullable state when `AsyncValue` is sufficient.

## Networking
- Use a centralized Dio client configuration.
- Configure interceptors for logging, auth, and error handling.
- API responses must be mapped into DTOs before converting to domain models.
- Avoid calling Dio directly from ViewModels or Widgets.

## Dependency Injection
- Use Riverpod providers for dependency injection.
- Avoid manually instantiating repositories or services inside widgets.

## Models
- Separate DTOs, domain models, and UI models.
- Never expose API DTOs directly to the UI layer.
- Use freezed for immutable models.

## Code Generation Rules
- Use `@freezed` for all domain models and UI state classes.
- Use `@JsonSerializable` on DTO classes (inside `data/models/`).
- Never manually edit `.g.dart` or `.freezed.dart` generated files.
- Always run after modifying any annotated file:
  dart run build_runner build --delete-conflicting-outputs
- During development, use watch mode:
  dart run build_runner watch --delete-conflicting-outputs
- Commit generated files to version control.

## Navigation
- Define routes in a centralized router configuration.
- Avoid hardcoded route strings inside widgets.
- Use typed navigation helpers where possible.
- Use `context.go()` to navigate and replace the current stack (e.g. after login, splash screen).
- Use `context.push()` to navigate and keep the current screen on the stack (e.g. detail screen).
- Use `context.pop()` to return to the previous screen; never use `Navigator.pop()`.
- Pass only primitive IDs via path or query parameters; resolve full objects inside the destination screen via a provider.
- Never construct route paths manually with string concatenation; use route constants or typed routes.

## Error Handling
- Use a sealed `Failure` class in the domain layer to represent all error types.
- Repository methods must return a `Result<T>` sealed class instead of throwing exceptions.
- Catch all exceptions in the Data layer and convert to a `Failure` before returning to Domain.
- UI layer must never handle raw exceptions directly.

### Failure Classes
Define failures in `lib/domain/failures/failure.dart`:
```dart
  sealed class Failure {
    const Failure(this.message);
    final String message;
  }

  class NetworkFailure extends Failure {
    const NetworkFailure([super.message = 'Network error occurred']);
  }

  class ServerFailure extends Failure {
    const ServerFailure(super.message, {this.statusCode});
    final int? statusCode;
  }

  class CacheFailure extends Failure {
    const CacheFailure([super.message = 'Cache error occurred']);
  }

  class UnexpectedFailure extends Failure {
    const UnexpectedFailure([super.message = 'An unexpected error occurred']);
  }
```

### Result Type
Define in `lib/utils/result.dart`:
```dart
  sealed class Result {
    const Result();
  }

  class Success extends Result {
    const Success(this.data);
    final T data;
  }

  class Failure extends Result {
    const Failure(this.failure);
    final Failure failure;
  }
```

### Usage Pattern
```dart
  // Repository
  Future<Result> getUser(String id) async {
    try {
      final dto = await _apiService.getUser(id);
      return Success(dto.toDomain());
    } on DioException catch (e) {
      return Failure(NetworkFailure(e.message ?? 'Network error'));
    } catch (e) {
      return Failure(UnexpectedFailure(e.toString()));
    }
  }

  // ViewModel
  Future loadUser(String id) async {
    state = const AsyncLoading();
    final result = await _userRepository.getUser(id);
    state = switch (result) {
      Success(:final data) => AsyncData(data),
      Failure(:final failure) => AsyncError(failure, StackTrace.current),
    };
  }
```

### Rules
- Always use `switch` with exhaustive pattern matching on `Result` — never use `is` checks.
- `Success` and `Failure` are the only two cases; never add more subtypes to `Result`.
- `Failure` subtypes live in the domain layer; they must not reference Dio or any data-layer types.

## Best Practices
- Avoid using `print()`, use `log()` from `dart:developer`.
- Comments should be written in English.
- Logs should include meaningful context.
- Every public method should have a short documentation comment (///).
- Never hardcode base URLs, API keys, or secrets in source code.
- Use `--dart-define` or `--dart-define-from-file` to inject environment variables at build time.
- Access env values through a centralized `AppConfig` or `Env` class in `lib/config/`.
- Provide separate configurations for `development`, `staging`, and `production`.

## Code Quality
- Generate production-ready code.
- Avoid placeholder implementations and TODO comments.
- Keep methods focused on a single responsibility.
- Prefer composition over inheritance.

## Testing
- Write unit tests for all ViewModels and repositories.
- Write widget tests for all screens.
- Test file must mirror the source path: `lib/ui/login/screens/login_screen.dart` → `test/ui/login/screens/login_screen_test.dart`.
- Use `ProviderContainer` for unit testing Riverpod providers.
- Mock repositories using `mockito` or `mocktail`.
- Never test implementation details; test behavior and state changes.