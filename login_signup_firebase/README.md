# Flutter App with Firebase Authentication (Login, Signup, Forgot Password)
This Flutter app demonstrates comprehensive user authentication features using Firebase Authentication. It allows users to:

1. **Sign Up:** Create a new account with email and password.

2. **Login:** Sign in to their existing account with email and password.
3. **Forgot Password:** Reset their password by providing their registered email address.

> Note: This is a basic example focusing on authentication. Additional features can be built upon this foundation.

## Features:

1. User registration with email and password.
2. User login with email and password.
Secure user authentication through Firebase Authentication.
3. Password reset functionality to recover lost credentials.

## Screenshots:
![1](<markdown assets/1.jpeg>)
![2](<markdown assets/2.jpeg>)
![3](<markdown assets/3.jpeg>)
![4](<markdown assets/4.jpeg>)

## Running the App:

1. Clone the repository.
2. Follow Firebase setup instructions to configure your project (refer to Firebase documentation).
3. Run ```flutter pub get``` to install dependencies.
4. Run ```flutter run``` to launch the app on your device or simulator.

## Firebase Configuration:

- This project utilizes Firebase for user authentication.
- You'll need to create a Firebase project and configure it within the app (replace placeholder values in code).
- Use ```flutterfire configure``` to configure the Firebase.

### Additional Information:

1. Consider implementing secure password storage and handling in your production app.
2. Explore Firebase's other functionalities like databases, storage, and real-time features to build more complex and scalable applications.

### Forgot Password Functionality:

- Users can initiate a password reset process by providing their registered email address.
- Firebase sends a password reset link to the user's email, allowing them to create a new password.