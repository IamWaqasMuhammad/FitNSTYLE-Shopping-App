# FitNSTYLE 👕👗

A modern, highly responsive, and feature-first **Clothing E-commerce Application** built using Flutter. This application utilizes a powerful hybrid backend infrastructure designed for optimal speed, real-time data streaming, and scalable data management.

## 🚀 Features & Core Implementation

- **Feature-First Architecture**: Organized cleanly using dynamic `core/` (shared tokens, typography, constants, custom components) and `features/` (auth, splash, onboarding modules) layers.
- **State Management & DI**: Powered entirely by the **GetX** alongside predictive startup dependency management via `InitialBinding` workflows.
- **Hybrid Backend Infrastructure**: Features a specialized backend configuration that leverages Firebase for absolute security alongside a custom REST API layer for product ecosystem interactions.

## 🛠️ Tech Stack & Architecture

### Frontend (Mobile App)
- **Framework**: Flutter SDK & Dart
- **State Management & Routing**: GetX

### Backend Services
- **Authentication & Security**: **Firebase Auth** handles secure user registration, token management, and social login authentication.
- **Application Logic Server**: Custom REST API endpoints developed using **Node.js** and **Express.js** to process heavy e-commerce transactions, cart profiles, and order data pipelines.
- **Database Layer**: **MongoDB Atlas** serves as the primary cloud database, implementing highly efficient non-relational document indexing maps for product variations, apparel sizes, and user metrics data.

## 📦 Project Directory Structure

```text
lib/
│
├── core/                  # Global shared assets, bindings, and configurations
│   ├── common_widgets/    # Reusable component views (CustomButton, CustomTextField)
│   ├── constants/         # AppColors, AppTextStyles, AppSizes tokens
│   ├── initial_binding/   # Global root startup injector framework (Handles Core Controllers)
│   └── utils/             # Extensions and generic helper files
│
└── features/              # Feature modules containing isolated workflows
│    └── auth/              # Complete user authentication workflow (Views, Widgets, Controllers)
│       ├── views/    
│       ├── controller/        
│       ├── binding/  
│       └── widgets/
```

## ⚙️ Development & Infrastructure Setup

### Prerequisites
Before running the application, ensure your local development machine contains valid setup configurations for the Flutter SDK environment alongside global tools.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/IamWaqasMuhammad
   cd FitNSTYLE-Shopping-App
   ```

2. **Clean build cache and download packages**:
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Configure Environment Paths**:
    - Ensure your Firebase configuration metadata profiles (`google-services.json` for Android / `GoogleService-Info.plist` for iOS) are attached inside the respective platform directories.
    - Configure your target server API base URLs inside the project's internal `core/constants/` logic wrappers.

4. **Run on target physical device / emulator**:
   ```bash
   flutter run
   ```

### Contact Me
1. **Email**: waqasmuhammad5254@gmail.com
2. **Linkedin**: https://www.linkedin.com/in/waqasmuhammad1
3. **Instagram**: https://www.instagram.com/waqas_5254