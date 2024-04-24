import 'package:flutter/material.dart'; // Flutter material design components

// Error screen widget
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  final String error; // Error message to display

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'), // Display 'Error' as app bar title
      ),
      body: Center(
        child: Text(
            error), // Display provided error message in the center of the screen
      ),
    );
  }
}
