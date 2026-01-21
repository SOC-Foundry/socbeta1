# SOC Foundry

**Next-Generation SIEM & Agentic AI Security Platform**

Welcome to the **SOC Foundry** frontend repository. This project serves as the customer-facing web platform for our B2B enterprise security solution. It has been redesigned with a **Vercel-inspired** high-contrast aesthetic to appeal to engineering and security leaders.

---

## 🛠️ Tech Stack & Architecture

We adhere to a strict set of engineering standards to maintain code quality. Please review `GEMINI.md` in the project root for our specific coding preferences.

- **Framework**: [Flutter](https://flutter.dev) (Web Target)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router) - Declarative routing.
- **State Management**: [Riverpod](https://riverpod.dev) - Reactive caching.
- **Styling**: **Inter** (UI) & **JetBrains Mono** (Code) via `google_fonts`.
- **Animations**: [Flutter Animate](https://pub.dev/packages/flutter_animate) - Particle simulations and effects.

---

## 📂 Project Structure Framework

```text
lib/
├── main.dart               # 🏁 Application Entry Point & Theme Config
├── router.dart             # 🚦 Navigation Configuration
├── home_page.dart          # 🏠 Main Landing Page
│
├── features/               # 📦 Feature-Specific Modules
│   └── diagrams/           #    - Interactive Flutter Representations
│       ├── pipeline_simulation.dart
│       └── fanout_visualization.dart
│
├── theme/                  # 🎨 Design System
│   └── app_theme.dart      #    - Defines Colors, Typography, & Styles
│
└── widgets/                # 🧩 Reusable UI Components
    ├── tech_card.dart      #    - Standard container with hover effects
    ├── code_block.dart     #    - Terminal-style text display
    ├── status_badge.dart   #    - Severity indicators
    └── glowing_border.dart #    - High-visibility accents
```

### Key Components

1.  **`lib/features/diagrams/`**:
    *   **Interactive Visualizations**: We replaced static images/HTML diagrams with native Flutter code. This allows us to animate data flow (packets moving from SIEM to Agents) and make the architecture explorable.

2.  **`lib/theme/app_theme.dart`**:
    *   Centralized definition of our "Dark Mode" aesthetic. Changes here propagate globally.

---

## 🚀 Getting Started

### Prerequisites
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
*   **Android SDK Command-line Tools** (if developing on Linux/Android).

### Running the App locally

1.  **Get Dependencies**:
    ```bash
    flutter pub get
    ```

2.  **Run in Chrome**:
    ```bash
    flutter run -d chrome
    ```

### Code Quality Check

Before submitting any code, **you must run the analyzer**. We use strict type checking rules.

```bash
flutter analyze .
```

---

## 🎨 Design Guidelines

*   **Theme**: Strict **Pure Black** (`Color(0xFF000000)`) background for high contrast.
*   **Surface**: Dark Anthracite (`Color(0xFF111111)`) for cards and elevated surfaces.
*   **Typography**:
    *   **UI**: `Inter` (Clean, minimalist).
    *   **Data/Code**: `JetBrains Mono` (Technical, tabular).
    *   **Headings**: `Orbitron` (Futuristic branding only).
*   **Borders**: Subtle 1px borders (`Color(0xFF333333)`) that may glow on interaction.

---

## 🤝 Contribution Workflow

1.  **Check the Board**: Pick a task.
2.  **Create a Branch**: `git checkout -b feature/my-feature`.
3.  **Implement**: Use `TechCard` and `AppTheme` standards.
4.  **Verify**: Run `flutter analyze`.
5.  **Commit**: Write a clear commit message.

> "Clean code looks like it was written by someone who cares."