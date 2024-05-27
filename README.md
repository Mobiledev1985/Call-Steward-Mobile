
# Call Steward

A brief description of what this project does and who it's for

## Getting Started

To run this Flutter project, follow these steps:

    1. Clone the repository to your local machine.
    2. Install Flutter and Dart SDK on your system.
    3. Run `flutter pub get` in the project root directory to fetch dependencies.
    4. Connect a physical device or start an emulator.
    5. Run `flutter run` to launch the application.

## Folder structure

    ├─── android
    ├─── ios
    ├─── lib
          ├─── api
          ├─── constants
          ├─── controller
          ├─── localization    
          ├─── model       
          ├─── routes
          ├─── screens
          ├─── utils
                    └─── app_prefrences
                    └─── notification
                    └─── theme
                    └─── validation
                    └─── utilities.dart
          ├─── widgets
          └─── main.dart
    └─── pubspec.yaml
    
- This project is a Flutter application that follows a specific folder structure and includes various components, utilities, and utilizes the GetX state management library following the MVC pattern. It serves as a starting point for developing Flutter applications.
- **api**: This folder contains files related to API integration and communication. It typically includes classes or files responsible for making HTTP requests, handling responses, and managing API endpoints.

    - **api_interface.dart**: This file defines an abstract class called `ApiCallBacks`. It includes methods such as `onSuccess`, `onError`, `onConnectionError`, and `onLoading`. These methods serve as callbacks for different stages of API requests and responses, allowing for handling success, error, connection issues, and loading states.

    - **api_presenter.dart**: The `ApiPresenter` class is defined in this file. It takes an `ApiCallBacks` object as a constructor parameter. This class acts as a presenter that communicates with the API repository. It manages the API calls and handles responses, forwarding them to the appropriate callback methods defined in the `ApiCallBacks` interface.

    - **http_exception.dart**: This file includes an `HttpException` class, which represents an exception that can occur during HTTP requests. It can be used to handle and provide meaningful error messages when an error occurs during API communication.

    - **api_endpoints.dart**: The `api_endpoints.dart` file contains constants or variables that represent different API endpoints or URLs. It provides a centralized location to manage and access the various endpoints used in the application.

    - **rest_client.dart**: The `RestClient` class is defined in this file. It takes an `ApiPresenter` object as a constructor parameter. This class encapsulates the logic for making API requests using HTTP methods such as GET, POST, PUT, DELETE, etc. It manages the request types, constructs the API URLs using the base URL defined in `web_url`, and communicates with the API presenter to handle the responses.

    - **web_fields.dart**: This file defines the body parameters used in API requests. It typically includes variables or constants representing the data to be sent in the request body.

    - **web_url.dart**: The `web_url.dart` file includes the base URL for the API. It provides a single location to manage and access the base URL used for all API requests.

        These files collectively provide a structured approach to handle API integration and communication within the project. They help manage API endpoints, handle request/response logic, and provide callbacks for different stages of API communication.

- **constants**: The constants folder holds constant values used throughout the application. It is common to define things like API URLs, default configurations, error messages, or any other values that remain constant across different parts of the app.

- **controller**: The controller folder contains classes or files responsible for managing the state of the application. It often includes classes that handle business logic, data fetching, and state management patterns like Provider, Riverpod, or Bloc.

- **localization**: The localization folder handles localization and language support in the application. It typically includes files or classes responsible for managing translations, switching between different languages, and providing localized strings or resources.

- **model**: The model folder defines data models used in the application. It includes classes that represent different data structures or entities used in the app, such as user, product, or order. These models are often used for serialization, deserialization, and type safety.

- **routes**: The routes folder manages the routing and navigation within the application. It typically includes a file or class that defines the different routes or screens in the app and handles the navigation between them.

- **screens**: The screens folder contains individual screens or pages of the application. Each screen is usually represented by a separate file or class and represents a specific UI component or user interface of the app. Screens often interact with controllers, models, and widgets to display data and handle user interactions.

- **utils**: The utils folder houses utility classes and functions that provide common functionality across the application. It can include various subfolders or files dedicated to specific utility categories or functionalities.

  - **app_preferences**: The app_preferences folder manages application-specific preferences and settings. It often includes classes or files responsible for storing and retrieving user preferences, settings, or configurations.

  - **notification**: The notification folder handles push notifications and related functionality. It typically includes classes or files responsible for registering devices for push notifications, handling incoming notifications, and managing notification-related logic.

  - **theme**: The theme folder manages the application's theme and styling. It often includes files or classes responsible for defining the overall app theme, such as colors, fonts, and styles. These files can be used to provide a consistent and visually appealing UI across the app.

  - **validation**: The validation folder provides validation functions for user input. It typically includes classes or files with reusable functions for validating user input, such as email validation, password validation, or form field validation.

  - **utilities.dart**: The utilities.dart file contains miscellaneous utility functions and helpers that don't fit into other specific utility categories. It can include general-purpose functions or helpers that are used throughout the application.

- **widgets**: The widgets folder contains reusable widgets and components that can be used across different screens or parts of the application. These widgets are often designed to be modular, customizable, and reusable to promote code reusability and maintainability.

- **main.dart**: The main.dart file serves as the entry point of the application. It typically includes the main function that runs the Flutter application and sets up the initial configuration, such as the root widget or the MaterialApp.





## State Management with GetX and MVC Pattern

This project utilizes the GetX state management library, which provides a lightweight and powerful solution for managing application state in Flutter. The MVC (Model-View-Controller) pattern is followed to separate concerns and ensure a clean and organized code structure.

- **Model**: The model folder defines data models used in the application. These models represent different data structures or entities used in the app and are responsible for serialization, deserialization, and type safety.

- **Controller**: The controller folder contains controllers or state management classes following the MVC pattern. Controllers handle the business logic and manage the state of the application. They communicate with models, fetch data from APIs, and update the state of the application, which triggers UI updates.

- **View**: The view folder represents the UI components of the application. Screens and widgets reside in the screens and widgets folders, respectively. Views are responsible for rendering the UI and displaying data to the user. They interact with controllers to retrieve data and update the UI accordingly.


## Additional Information

For more information about Flutter, GetX state management library, and MVC pattern, refer to the following resources:

- [Flutter Documentation](https://flutter.dev/docs)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [Flutter State Management Guide](https://docs.flutter.dev/data-and-backend/state-mgmt/options)
- [MVC Pattern in Flutter](https://www.educba.com/what-is-mvc-design-pattern/)

## Built With

Dart and Flutter

