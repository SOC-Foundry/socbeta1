# SOC Foundry

**Next-Generation SIEM & Agentic AI Security Platform**

Welcome to the **SOC Foundry** frontend repository. This project serves as the customer-facing web platform for our B2B enterprise security solution. It is built with **Flutter Web**, utilizing modern architectural patterns to ensure scalability, performance, and maintainability.

---

## 🛠️ Tech Stack & Architecture

We adhere to a strict set of engineering standards to maintain code quality. Please review `GEMINI.md` in the project root for our specific coding preferences.

- **Framework**: [Flutter](https://flutter.dev) (Web Target)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router) - Declarative routing package.
- **State Management**: [Riverpod](https://riverpod.dev) - A reactive caching and data-binding framework.
- **Styling**: [Google Fonts](https://pub.dev/packages/google_fonts) & Custom Dark Theme.
- **Animations**: [Flutter Animate](https://pub.dev/packages/flutter_animate) - For declarative effects.

---

## 📂 Project Structure Framework

We organize our code to separate concerns, making it easier for junior developers to navigate and contribute.

```text
lib/
├── main.dart               # 🏁 Application Entry Point
│                           #    - Sets up ProviderScope (Riverpod)
│                           #    - Configures Global Theme (Dark Mode)
│                           #    - Connects the Router
│
├── router.dart             # 🚦 Navigation Configuration
│                           #    - Defines all URL routes (e.g., '/')
│                           #    - Manages page transitions
│
├── home_page.dart          # 🏠 Main Landing Page
│                           #    - orchestrates the layout
│                           #    - assembles widgets into the scrollable view
│
└── widgets/                # 🧩 Reusable UI Components
    │                       #    (Small, isolated pieces of UI)
    ├── section_card.dart        # Standard container for text/features
    ├── diagram_agentic_ai.dart  # Interactive visualization of AI Agents
    └── diagram_siem_fanout.dart # Interactive visualization of AWS/S3 Architecture
```

### Key Directories Explained

1.  **`lib/widgets/`**:
    *   **Philosophy**: If a UI element is used more than once, or if it makes a file too long, extract it here.
    *   **Diagrams**: We prefer building diagrams (like the Agentic AI flow) using **native Flutter code** (`Row`, `Column`, `Stack`) rather than embedding images. This keeps them crisp on all screen sizes and allows us to animate individual nodes.

2.  **`lib/router.dart`**:
    *   We use **GoRouter** instead of basic `Navigator` because it supports deep linking (critical for web) and handles complex navigation scenarios much better.

---

## 🚀 Getting Started

### Prerequisites
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
*   An IDE (VS Code or Android Studio) with Flutter plugins.

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

*Tip: If you see "blue squiggles" in your IDE, fix them immediately. Do not commit code with analysis errors.*

---

## 🎨 Design Guidelines

*   **Theme**: The app uses a strict **Dark Theme** (`Color(0xFF0A0E17)` background).
*   **Colors**: Primary accent is **Cyan** (`0xFF00E5FF`). Use it sparingly for call-to-actions and high-importance highlights.
*   **Typography**:
    *   **Headings**: `Orbitron` (Futuristic, technical feel).
    *   **Body**: `Inter` (Clean, readable).
*   **Opacity**: Always use `.withValues(alpha: 0.5)` instead of the deprecated `.withOpacity(0.5)`.

---

## 🤝 Contribution Workflow

1.  **Check the Board**: Pick a task (e.g., "Add Login Screen").
2.  **Create a Branch**: `git checkout -b feature/login-screen`.
3.  **Implement**: Write your code, following the structure above.
4.  **Verify**: Run `flutter analyze` to ensure no linting errors.
5.  **Commit**: Write a clear commit message.

> "Clean code looks like it was written by someone who cares."