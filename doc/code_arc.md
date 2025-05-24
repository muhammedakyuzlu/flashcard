# Flashcard App - Architecture Guide

## 🎯 Quick Overview
This is a Flutter application built using the MVVM (Model-View-ViewModel) pattern. The app is organized into features and shared components, making it easy to maintain and scale.

## 📁 Project Structure
```
lib/
├── feature/           # All app features
│   └── home/         # Home screen feature
├── product/          # Shared components
│   ├── service/      # API and services
│   ├── navigation/   # App navigation
│   ├── state/        # Global state
│   ├── widget/       # Shared widgets
│   ├── constants/    # App constants
│   ├── utility/      # Helper functions
│   └── init/         # App setup
└── main.dart         # App entry point
```

## 🏗️ How It's Built

### 1. Features (What Users See)
Each feature (like Home, Auth, etc.) is built the same way:
```
feature/
└── feature_name/
    ├── view/              # What users see
    │   ├── screens/       # Full pages
    │   ├── widgets/       # UI parts
    │   └── mixin/         # Reusable view code
    └── view_model/        # Business logic
        ├── state/         # Feature state
        ├── events/        # User actions
        └── models/        # Data models
```

### 2. Shared Components (What Developers Use)
The `product` folder contains everything shared across features:

#### 🔌 Services (`product/service/`)
- Handles API calls
- Manages network errors
- Handles login/logout
- Files:
  - `login_service.dart`
  - `product_service_manager.dart`
  - `product_network_error_manager.dart`

#### 🧭 Navigation (`product/navigation/`)
- Manages app navigation
- Handles deep links
- Controls page transitions

#### 📊 State (`product/state/`)
- Manages app-wide state
- Handles data persistence
- Syncs data across features

#### 🎨 Widgets (`product/widget/`)
- Reusable UI components
- Common buttons, cards, etc.
- Theme-aware components

#### ⚙️ Other Shared Components
- `constants/`: App settings and values
- `utility/`: Helper functions
- `init/`: App startup code

## 💡 How to Use This Architecture

### Adding a New Feature
1. Create a new folder in `feature/`
2. Add `view/` and `view_model/` folders
3. Create your screens in `view/`
4. Add business logic in `view_model/`
5. Use shared components from `product/`

### Using Shared Components
- Need a button? Check `product/widget/`
- Making API calls? Use `product/service/`
- Managing state? Use `product/state/`
- Adding navigation? Use `product/navigation/`

## 🎯 Best Practices

### 1. Keep Features Independent
- Each feature should work on its own
- Use shared components for common code
- Don't create dependencies between features

### 2. State Management
- Use local state for simple UI
- Use feature state for feature data
- Use global state only when necessary

### 3. Code Organization
- Put UI code in `view/`
- Put business logic in `view_model/`
- Put shared code in `product/`

### 4. Error Handling
- Handle errors at the right level
- Show user-friendly messages
- Log errors properly

### 5. Performance
- Load features when needed
- Keep state management efficient
- Optimize widget tree

## 🚀 Getting Started

### For New Developers
1. Read this guide
2. Look at the `home` feature as an example
3. Use shared components from `product/`
4. Follow the established patterns

### For Feature Development
1. Create feature folder
2. Set up view and view_model
3. Add your screens
4. Use shared components
5. Test your feature

## 📝 Contributing
When adding code:
1. Follow the MVVM pattern
2. Keep features independent
3. Write tests
4. Update documentation
5. Use shared components
6. Handle errors properly

## 🔍 Current Modules

### Features
- **Home** (`feature/home/`)
  - Main app screen
  - User dashboard
  - Navigation hub

### Shared Components
- **Services** (`product/service/`)
  - API management
  - Error handling
  - Authentication

- **Navigation** (`product/navigation/`)
  - Route management
  - Deep linking
  - Page transitions

- **State** (`product/state/`)
  - Global state
  - Data persistence
  - State sync

- **Widgets** (`product/widget/`)
  - UI components
  - Common elements
  - Theme support

## 🎨 Theme and Styling
- Use theme constants from `product/constants/`
- Follow the app's design system
- Use shared widgets for consistency

## 🔒 Security
- Handle sensitive data properly
- Use secure storage
- Follow authentication best practices

## 📱 Platform Support
- Works on iOS and Android
- Responsive design
- Platform-specific code when needed
