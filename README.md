# test_app

## How to Use 

**Step 1:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 2:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

**Step 3:**

Run the app on a connected device, or iOS simulator, or Android Emulator.

If launch on iOS simulator, run this command first "cd ios/ && pod install"

```
flutter run
```
