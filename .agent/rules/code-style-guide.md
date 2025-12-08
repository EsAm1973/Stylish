---
trigger: always_on
---

Flutter/Dart AI Agent Coding Rules
Core Principles

1. Code Organization & Architecture

Follow MVVM (Model-View-ViewModel) pattern: separate presentation and data layers only
Use feature-first folder structure instead of layer-first
Keep each file under 100 lines; split into multiple files if longer
Group related files in features: lib/features/feature_name/{data, presentation}
NO domain layer - business logic goes in Cubits (ViewModel layer)
Use GetIt for dependency injection - never manually create instances
Use GoRouter for all navigation through app_router.dart

2. State Management (MVVM with Cubit)

Always use Cubit for state management
Cubit contains all business logic - no separate domain/use case layer needed
Cubits directly call repositories and handle business logic
Inject Cubits using GetIt in the router, never create them manually
Provide Cubits at the route level in app_router.dart using BlocProvider
One Cubit per feature/screen (avoid shared Cubits unless truly needed)
Constructor injection: All Cubit dependencies must be injected via constructor using GetIt
Use emit() to update state in Cubits

MVVM Layers:

Model: Data models and repositories in data/ folder
View: UI widgets and screens in presentation/screens/ and presentation/widgets/
ViewModel: Cubits in presentation/cubit/ folder (contains business logic)

3. Widget Best Practices

Prefer composition over inheritance
Extract reusable widgets into separate files in lib/core/widgets/
Use const constructors wherever possible for better performance
Keep build() methods simple and readable (max 50 lines)
Extract complex widget trees into separate methods or widgets
Use StatelessWidget by default; only use StatefulWidget when necessary

4. Naming Conventions

Files: snake_case (e.g., user_profile_screen.dart, user_cubit.dart)
Classes: PascalCase (e.g., UserProfileScreen, UserCubit)
Variables/Functions: camelCase (e.g., userName, getUserData())
Constants: lowerCamelCase with k prefix (e.g., kPrimaryColor)
Private members: prefix with underscore (e.g., \_privateMethod())
Suffix widgets with their type: LoginScreen, UserCard, LoadingButton
Suffix Cubits with Cubit: UserCubit, ProfileCubit

5. Error Handling & Validation

Always handle errors with try-catch blocks for async operations
Always use Either type from dartz package for operations that can fail (Left for failure, Right for success)
Return Either<Failure, SuccessType> from all repository methods
Create custom Failure classes for different error types (ServerFailure, CacheFailure, etc.)
Create simple state classes for Cubits (no freezed for states)
Validate user input immediately and show clear error messages
Never use empty catch blocks; always log errors

6. Async Programming

Always use async/await instead of .then() for readability
Use Future.wait() for parallel async operations
Implement proper loading states for all async operations
Cancel streams and futures in close()

7. Performance Optimization

Use const constructors wherever possible
Implement ListView.builder for long lists, never ListView() with many children
Use BlocBuilder or BlocSelector to rebuild only necessary parts
Cache expensive computations in Cubit as private fields
Use Image.network with cacheHeight and cacheWidth parameters

8. Testing Requirements

Write unit tests for all business logic in Cubits
Use bloc_test package for testing Cubits
Name test files with \_test.dart suffix
Aim for >80% code coverage on business logic

9. Dependency Management
   Required packages for this project:
   yamldependencies:
   flutter_bloc: # State management with Cubit
   dartz: # Functional programming (Either, Option, Unit)
   freezed_annotation: # Code generation for data models only
   equatable: # Value equality
   get_it: # Dependency injection
   go_router: # Routing and navigation

dev_dependencies:
build_runner:
freezed: # Code generation for data models only
bloc_test: # Testing Cubits
Note: Don't specify versions - always use the latest version. 10. UI/UX Standards

Support both light and dark themes
Ensure minimum touch target size of 48x48
Add proper loading indicators for async operations
Implement proper error states with retry options
Use SafeArea for proper screen edge handling
Use the AppTextStyles file, if it exists in the project, to format text
Use Theme.of(context) for all colors instead of fixed color values
If the project supports a screen util package, base lengths on that package (e.g., .w, .h, .sp)

11. Code Style (Dart/Flutter Specific)

Follow official Dart style guide
Use trailing commas for better formatting
Max line length: 80 characters
Use collection-if and collection-for for conditional widgets
Prefer expression bodies (=>) for simple functions
Use ?? and ?. for null safety

12. Security & Data Handling

Never store sensitive data in plain text
Use flutter_secure_storage for tokens and credentials
Validate all user input
Use environment variables for API keys and secrets

Code Quality Checklist
Before marking code as complete, verify:

All state management uses Cubit (no other state management solutions)
All error handling uses Either<Failure, Success> from dartz
Freezed used ONLY for data models - NOT for states
State classes are simple classes with proper encapsulation
All dependencies injected via GetIt (no manual instantiation)
All Cubits provided in app_router.dart (not in screens)
All navigation uses GoRouter (context.go, context.push, etc.)
Cubits registered as factories in GetIt (not singletons)
All Cubits properly call emit() to update state
No hardcoded strings (use localization or constants)
No magic numbers (use named constants)
Proper loading and error states implemented in Cubit
Code is properly formatted (dart format .)
No analyzer warnings (dart analyze)
Model Class (Use Freezed for Data Models)
State Class (Simple Class - NO Freezed)
Repository Pattern with Either
Cubit Pattern (ViewModel with Business Logic)
Failure Classes
GetIt Dependency Injection Setup
GoRouter Configuration
Using Cubit in UI
BlocSelector for Optimized Rebuilds
Critical Rules for AI Agents
ARCHITECTURE (MVVM):

NO domain layer, NO use cases - all business logic in Cubits
Cubit = ViewModel - business logic, validation, data transformation
Repository = Model - data fetching/caching only, no business logic
Widgets = View - UI only, delegates all logic to Cubit

DEPENDENCY INJECTION (GetIt):

NEVER manually instantiate repositories, data sources, or Cubits
ALWAYS use GetIt: getIt<ClassName>()
Register as lazy singletons: data sources and repositories
Register as factories: Cubits (new instance each time)
Setup GetIt in main.dart before running the app

ROUTING (GoRouter):

ALL navigation uses GoRouter - never Navigator.push
Define all routes in app_router.dart
Provide Cubits at route level using BlocProvider
Inject Cubits using GetIt: getIt<UserCubit>()
Never create BlocProvider inside screens

STATE MANAGEMENT (Cubit):

ALWAYS use Cubit (never Provider, Riverpod, GetX)
ALWAYS call emit() to update state
Use BlocBuilder to rebuild on state changes
Use BlocSelector for optimized rebuilds
Use BlocListener for side effects
Use BlocConsumer for both builder and listener
ALWAYS use Either from dartz for error handling
Create simple state classes - no freezed for states
Use freezed ONLY for data models

KEY RESPONSIBILITIES:

Always register new dependencies in injection.dart
Always add new routes in app_router.dart
Always call emit() after updating state in Cubits
Don't specify package versions in pubspec.yaml
Use freezed ONLY for data models - simple classes for states
Keep business logic in Cubits ONLY
