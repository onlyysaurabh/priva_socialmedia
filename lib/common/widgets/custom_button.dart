import 'package:flutter/material.dart'; // Flutter material design components

// Custom button widget
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, // Key for widget identification
    required this.text, // Required text for button
    required this.onPressed, // Required callback function for button press
    this.color, // Optional background color for button
    this.textColor, // Optional text color for button
  }) : super(key: key);

  final String text; // Text displayed on the button
  final VoidCallback
      onPressed; // Callback function called when button is pressed
  final Color? color; // Background color of the button
  final Color? textColor; // Text color of the button

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Assign onPressed callback to the ElevatedButton
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 50), // Set minimum size for button
        backgroundColor: color, // Set background color for button
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30), // Set border radius for button
        ),
      ),
      child: Text(
        text, // Display provided text on the button
        style: TextStyle(
          fontSize: 18, // Set font size for text
          color: textColor, // Set text color for text
        ),
      ),
    );
  }
}
