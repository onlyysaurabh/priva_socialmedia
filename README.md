# Priva socialmedia

This is a Flutter project for a private social media application.

## Description

The Priva project aims to create a secure and private social media platform. It provides users with a safe space to connect and share content with their friends and family, without compromising their privacy.

## Dependencies

dependencies:
    flutter:
        sdk: flutter
    cupertino_icons: ^1.0.2
    firebase_core: ^2.27.1
    firebase_auth: ^4.17.9
    cloud_firestore: ^4.15.9
    firebase_storage: ^11.6.10
    country_picker: ^2.0.15
    flutter_riverpod: ^2.0.0-dev.9
    image_picker: ^1.0.7
    flutter_contacts: ^1.1.5
    uuid: ^3.0.6
    intl: ^0.19.0
    cached_network_image: ^3.2.1
    cached_video_player: ^2.0.3
    enough_giphy_flutter: ^0.4.1
    flutter_sound: ^9.2.13
    path_provider: ^2.0.11
    permission_handler: ^11.3.0
    audioplayers: ^6.0.0
    swipe_to: ^1.0.2
    story_view: ^0.16.0
    agora_uikit: ^1.0.2
    giphy_picker: ^3.0.2
    emoji_picker_flutter: ^2.1.1
    flutter_keychain: ^2.4.0
    change_app_package_name: ^1.1.0
    just_audio: ^0.9.36
    rxdart: ^0.27.7
    news_api_flutter_package: ^1.2.0
    flutter_webview_plugin: ^0.4.0
    asn1lib: ^1.5.2
    fast_rsa: ^3.6.1


## Features

- User authentication and registration
- Secure messaging and chat functionality
- Privacy settings to control visibility of user's content
- News feed with personalized content
- Photo and video sharing

# priva_socialmedia


Flutter uses widgets as the building blocks for creating user interfaces. These widgets can be simple, like displaying text, or complex, like a button that triggers an action. Here's a breakdown of the different widget types and how they work:

**Basic Widgets:**

* **Container:** This versatile widget forms the foundation for most layouts. It adds padding, margins, borders, and background color to its child widget. Use it to style and position other widgets.

* **Row & Column:** These widgets arrange their child widgets in a horizontal (Row) or vertical (Column) direction. They are essential for building layouts and are often used together to create grids.

* **Text:** This widget displays text with styling options like font size, color, and decoration. It's the fundamental way to present textual information in your app.

**Layout Widgets:**

* **Stack:** Unlike Row and Column, Stack widgets position their children on top of each other in the order they are added. This allows for overlapping elements and creating depth effects.

* **Padding & Margin:** These widgets add empty space around their child widget. Padding creates space within the widget's borders, while Margin creates space outside the borders. They are useful for fine-tuning the layout and aesthetics.

**Material Design Widgets:**

Flutter offers a rich set of widgets that follow Material Design principles, a popular design language for mobile apps. These widgets provide a familiar and consistent look and feel.

* **RaisedButton & FlatButton:** These are Material Design buttons that provide visual feedback on press. Raised buttons simulate elevation, while flat buttons are simpler. Use them for user interactions and triggering actions.

* **Image:** This widget displays images from various sources like assets or URLs. It's essential for incorporating visuals into your app.

**Stateful vs. Stateless Widgets:**

* **StatefulWidget:** These widgets hold state information that can change over time. They are ideal for situations where the UI needs to update dynamically based on user interaction or data changes.

* **StatelessWidget:** These widgets represent a fixed UI that doesn't change. They are simpler to use and more efficient for static elements.

These are just a few examples, and Flutter offers a vast collection of widgets for various functionalities. By understanding these basic types and their use cases, you can start building user interfaces for your Flutter apps.

For a more comprehensive exploration of Flutter widgets, refer to the official documentation's widget catalog [https://docs.flutter.dev/ui/widgets](https://docs.flutter.dev/ui/widgets).



Consumer widgets in Flutter are a way to interact with the state management solution you've chosen for your project. They allow you to:

* **Access values provided by a state management system:**  When you have a value or object managed by a provider, you can use the Consumer widget to obtain it within a widget subtree.
* **Rebuild widgets when state changes:**  The Consumer widget acts as a listener. When the state value it's listening to changes, the Consumer widget will schedule a rebuild of its descendants.

**Key Points**

* **Belong to State Management Packages:** Consumer widgets are usually part of state management packages like **provider** or **riverpod**.
* **Wrapper Widgets:** Consumer widgets work by wrapping the part of your widget tree that needs access to a particular piece of state and should rebuild when that state changes.

**Example with the 'provider' package:**

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCounter extends ChangeNotifier {
  int _count = 0;
  void increment() {
    _count++;
    notifyListeners(); // Notify providers of a state change
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCounter>(
      create: (_) => MyCounter(),
      child: MaterialApp(
        home: CounterDisplay(),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<MyCounter>(
          builder: (context, counter, child) => Column(
            children: [
              Text('Count: ${counter._count}'),
              ElevatedButton(
                onPressed: () => counter.increment(),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**Explanation:**

1. **ChangeNotifierProvider:** Makes the `MyCounter` instance available to widgets below it in the widget tree.
2. **Consumer<MyCounter>:** Accesses the instance of `MyCounter`. 
3. **builder Function:** Called whenever the count value inside `MyCounter` changes, rebuilding only portions of the UI that depend on that counter.

**Let me know if you'd like to see an example with Riverpod or another state management system!** 



Flutter utilizes various packages to interact with Firebase functionalities. Here's a breakdown of basic commands for accessing and managing data in Firebase Realtime Database (a common choice):

**1. Setting up Firebase:**

* Include the `firebase_core` and `firebase_database` packages in your `pubspec.yaml` file.
* Follow Firebase documentation to set up your project and obtain the configuration details (project ID, database URL, etc.).
* Use the `Firebase.initializeApp()` method to initialize Firebase in your `main.dart` file.

**2. Accessing Data:**

* Import the `FirebaseDatabase` class.
* Use the `instance` property of `FirebaseDatabase` to access the database reference.
* Construct references to specific locations in the database using methods like `child()`, `reference()`, and `referenceFromUrl()`.

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

// ... (after Firebase initialization)

final databaseReference = FirebaseDatabase.instance.reference();
final usersReference = databaseReference.child('users'); // reference to 'users' node
```

**3. Reading Data:**

* Use the `once()` method to read data from a specific location at a single point in time.
* The `once()` method returns a `Future<DataSnapshot>`.
* Use the `value` property of the `DataSnapshot` to access the data as a `Map<dynamic, dynamic>`.

```dart
Future<void> readUserData(String userId) async {
  final userRef = usersReference.child(userId);
  final snapshot = await userRef.once();
  final userData = snapshot.value as Map<dynamic, dynamic>;
  
  // access specific data fields using userData['fieldName']
}
```

**4. Writing Data:**

* Use the `set()` method to write data to a specific location.
* Provide the data you want to write as a `Map<String, dynamic>`.

```dart
Future<void> writeUserData(String userId, Map<String, dynamic> data) async {
  final userRef = usersReference.child(userId);
  await userRef.set(data);
}
```

**5. Updating Data:**

* Use the `update()` method to update specific fields within a location.
* Provide a `Map<String, dynamic>` containing the fields to update.

```dart
Future<void> updateUserEmail(String userId, String newEmail) async {
  final userRef = usersReference.child(userId);
  await userRef.update({'email': newEmail});
}
```

**6. Listening for Data Changes:**

* Use the `onValue` method to listen for changes in real-time.
* This method provides a `Stream<DataSnapshot>` that emits events whenever the data changes.

```dart
Stream<DataSnapshot> listenForUserData(String userId) {
  final userRef = usersReference.child(userId);
  return userRef.onValue;
}
```

These are fundamental commands for interacting with Firebase Realtime Database in Flutter. Remember to handle errors appropriately and explore the official documentation for more advanced functionalities like queries, security rules, and offline capabilities.
