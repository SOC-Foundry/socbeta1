# Project Context
This is a Flutter web application using Firebase Hosting and Firestore.

# Tech Stack Rules
- **State Management:** Use Riverpod (with code generation) for all state management.
- **Routing:** Use GoRouter for navigation.
- **Firebase:** Use `flutterfire` CLI for configuration.
- **Style:** strict-inference, strict-raw-types.

# Coding Preferences
- Use `ref.watch` inside build methods; do not use `ConsumerWidget` unless necessary for optimization.
- Always use `const` constructors where possible.
- When creating UI, prioritize responsiveness for Web (Mobile, Tablet, Desktop layouts).
- Return all simplified async logic as `Future<void>` or `Stream<T>`.
