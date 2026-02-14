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

# Operational Rules
- **Git Operations:** Do NOT run `git` commands (add, commit, push) automatically. Always ask for user confirmation or let the user run them.

---

## Project Updates (December 3, 2025)

### Core Website Development
-   **Site Transformation**: Replaced placeholder content with a professional B2B enterprise security site ("SOC Foundry").
-   **Theming**: Implemented a modern dark theme with specific color palettes and Google Fonts (Orbitron, Inter).
-   **UI Components**: Developed custom, responsive Flutter widgets for displaying complex architectural diagrams (`AgenticAiDiagram`, `SiemFanoutDiagram`) using native Flutter UI elements rather than embedded images.
-   **Content Integration**: Incorporated extensive technical descriptions and messaging into `SectionCard` widgets.
-   **Hero Section**: Updated the hero section with branding, a tagline, and a call-to-action button.
-   **Logo & Favicon**: Configured and integrated the site logo (from `logo-og.png` to `assets/images/logo.png`) and favicon.

### Architectural & Code Quality Enhancements
-   **Dependencies**: Added `google_fonts`, `flutter_animate`, `font_awesome_flutter` for UI; `flutter_riverpod`, `riverpod_annotation`, `go_router`, `riverpod_generator`, `build_runner`, `custom_lint`, `riverpod_lint` for state management, routing, and code generation.
-   **Analysis Options**: Configured `analysis_options.yaml` to enforce strict language rules (`strict-casts`, `strict-inference`, `strict-raw-types`) as specified.
-   **Routing**: Implemented `GoRouter` for application navigation via `lib/router.dart`.
-   **State Management**: Integrated `Riverpod` by setting up `ProviderScope` and using `ConsumerWidget` in `main.dart`.
-   **API Deprecation Fixes**: Replaced deprecated `.withOpacity()` calls with `.withValues(alpha: ...)`.

### DevOps & Deployment
-   **Firebase Hosting**: Corrected `firebase.json` to correctly serve Flutter's `build/web` directory.
-   **Authentication**: Handled Firebase CLI authentication issues (`firebase login --reauth`).
-   **GitHub Actions**: Updated CI/CD workflows (`.github/workflows/*.yml`) to correctly build Flutter web projects using `flutter pub get` and `flutter build web` commands, replacing previous Node.js build steps.
-   **Deployment Strategy**: Utilized `firebase deploy --project websitealpha` to ensure deployments target the correct project.
-   **Documentation**: Created a detailed `PROJECT_SUMMARY.md` and updated `README.md` with project specifics and contribution guidelines.