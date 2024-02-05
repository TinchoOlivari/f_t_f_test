# FTF App Test - Clean architecture

The **cleanest (architectured)** flutter app designed to provide the git commit history for any pre-configured github repository. The repository to be tracked is easily configurable via the `config.dart` file.

### Flutter Versions `3.13.9`

## Getting Started

1. [Install flutter](https://docs.flutter.dev/get-started/install)
2. Clone the repo.
3. Run `flutter pub get` to fetch the dependencies.
4. Run `flutter run` to start the application.

## Why Provider?

Choosing Provider for state management in a Flutter app provides simplicity and flexibility. Is great for small Flutter apps:

- It embraces a declarative approach, enhancing code readability.
- Reduce boilerplate code and improve the dev experience.
- Minimal setup make it ideal for straightforward scenarios.

## Models

Models were generated with [app.quicktype.io](https://[app.quicktype.io]).
I copied the example response from [Github Api Docs](https://https://docs.github.com/es/rest/commits/commits?apiVersion=2022-11-28#list-commits) and generated the code for Dart. Yhis is one of the fastest methods to generate working models.

## Why clean architecture?

Clean Architecture provides a clear separation of concerns. A modular structure that isolates the core business logic from the presentation layer and external dependencies. Clean Architecture involves organizing code into distinct layers such as domain, data, and presentation, ensuring that the Flutter framework-specific code remains on the outer layers. This separation enhances testability, adaptability to change, and facilitates the reuse of business logic across different platforms.