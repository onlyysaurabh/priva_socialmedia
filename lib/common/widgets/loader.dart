import 'package:flutter/material.dart'; // Flutter material design components

// Loader widget
class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:
          CircularProgressIndicator(), // Display a circular progress indicator at the center of the screen
    );
  }
}
