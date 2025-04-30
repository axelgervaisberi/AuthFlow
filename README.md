# AuthFlow

A beautiful authentication system with smooth animations using Flutter, Firebase Auth, and MVVM architecture. This app provides a complete authentication flow with login, registration, and password reset functionality.

## Features

- **Email & Password Authentication**: Secure login and registration
- **Password Reset**: Easy password recovery flow
- **Form Validation**: Comprehensive input validation
- **Beautiful UI**: Modern design with smooth animations
- **MVVM Architecture**: Clean separation of concerns
- **Firebase Integration**: Secure backend authentication
- **Responsive Design**: Works across different screen sizes
- **Error Handling**: User-friendly error messages

## Screenshots

Add your app screenshots here once available.

![Login Screen](screenshots/login.png) ![Register Screen](screenshots/register.png)
![Reset Password Screen](screenshots/reset_password.png) ![Home Screen](screenshots/home.png)

## Project Structure

The project follows the MVVM (Model-View-ViewModel) architecture pattern:

```bash
lib/
├── constants/       # App-wide constants like themes
├── models/          # Data models
├── services/        # Service layer (Firebase, API calls)
├── utils/           # Utility functions and helpers
├── viewmodels/      # Business logic and state management
├── views/           # UI components
│   ├── screens/     # Full screens
│   └── widgets/     # Reusable UI components
├── firebase_options.dart  # Firebase configuration
└── main.dart        # App entry point
```

## Setup Instructions

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Firebase account
- Android Studio, VS Code, or another IDE with Flutter support

### Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and Email/Password sign-in method
3. Add your app to the Firebase project
4. Download the configuration files:
   - For Android: `google-services.json` to `/android/app/`
   - For iOS: `GoogleService-Info.plist` to `/ios/Runner/`
5. Update the Firebase configuration in `lib/firebase_options.dart`

### Customizing Firebase Authentication Emails

1. Go to the Firebase Console > Authentication > Templates
2. Edit the Password Reset template:
   - Change Sender name from "authflow-aaa3c" to "AuthFlow"
   - Update Subject to "Reset your AuthFlow password"
   - Modify Email body to replace all instances of "authflow-aaa3c" with "AuthFlow"
   - Update Email footer to show "The AuthFlow Team"
3. Similarly update other email templates (Email Verification, Email Change)

### Installation

1. Clone the repository

   ```bash
   git clone https://github.com/yourusername/authflow.git
   cd authflow
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## App Architecture

### MVVM Implementation

This project follows the Model-View-ViewModel (MVVM) architecture pattern:

- **Models**: Data structures that represent the app's data (e.g., `UserModel`)
- **Views**: UI components that display data and handle user interactions
- **ViewModels**: Business logic layer that connects models and views
- **Services**: Backend services like Firebase Authentication

### Key Components

- **AuthService**: Handles Firebase authentication operations
- **AuthViewModel**: Manages authentication state and business logic
- **Validators**: Form validation utilities
- **Custom Widgets**: Reusable UI components like buttons and input fields

## Docker Support

A Dockerfile is included for containerization:

```bash
docker build -t authflow .
docker run -p 8080:8080 authflow
```

## Git Workflow

The project uses GitLab for version control with the following workflow:

- `main` branch for stable releases
- Feature branches for new development
- Tags for major milestones

## License

This project is licensed under the MIT License - see the LICENSE file for details.
