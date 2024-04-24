// ignore_for_file: unused_import

// Importing necessary packages and files
import 'dart:io'; // For file operations
import 'package:flutter/material.dart'; // Flutter material design components
import 'package:Priva/common/widgets/error.dart'; // Custom error screen widget
import 'package:Priva/features/auth/screens/login_screen.dart'; // Login screen widget
import 'package:Priva/features/auth/screens/otp_screen.dart'; // OTP screen widget
import 'package:Priva/features/auth/screens/user_information_screen.dart'; // User information screen widget
import 'package:Priva/features/group/screens/create_group_screen.dart'; // Create group screen widget
import 'package:Priva/features/select_contacts/screens/select_contacts_screen.dart'; // Select contacts screen widget
import 'package:Priva/features/chat/screens/mobile_chat_screen.dart'; // Mobile chat screen widget
import 'package:Priva/features/status/screens/confirm_status_screen.dart'; // Confirm status screen widget
import 'package:Priva/features/status/screens/status_screen.dart'; // Status screen widget
import 'package:Priva/models/status_model.dart'; // Status model
import 'package:Priva/features/landing/screens/landing_screen.dart'; // Landing screen widget

// Function to generate routes dynamically based on route settings
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen
          .routeName: // If the requested route is for the login screen
      return MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(), // Build and return the login screen
      );
    case OTPScreen.routeName: // If the requested route is for the OTP screen
      final verificationId = settings.arguments
          as String; // Extract verification ID from arguments
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ), // Build and return the OTP screen with verification ID
      );
    case UserInformationScreen
          .routeName: // If the requested route is for the user information screen
      return MaterialPageRoute(
        builder: (context) =>
            const UserInformationScreen(), // Build and return the user information screen
      );
    case SelectContactsScreen
          .routeName: // If the requested route is for the select contacts screen
      return MaterialPageRoute(
        builder: (context) =>
            const SelectContactsScreen(), // Build and return the select contacts screen
      );
    case MobileChatScreen
          .routeName: // If the requested route is for the mobile chat screen
      final arguments = settings.arguments
          as Map<String, dynamic>; // Extract arguments from settings
      final name = arguments['name']; // Extract name from arguments
      final uid = arguments['uid']; // Extract uid from arguments
      final isGroupChat = arguments['isGroupChat']
          ? true
          : false; // Extract if it's a group chat from arguments
      final profilePic = 'no imanfe'; // Placeholder for profile picture
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
          isGroupChat: isGroupChat,
          profilePic: profilePic,
        ), // Build and return the mobile chat screen with provided parameters
      );
    case ConfirmStatusScreen
          .routeName: // If the requested route is for the confirm status screen
      final file = settings.arguments as File; // Extract file from arguments
      return MaterialPageRoute(
        builder: (context) => ConfirmStatusScreen(
          file: file,
        ), // Build and return the confirm status screen with provided file
      );
    case StatusScreen
          .routeName: // If the requested route is for the status screen
      final status =
          settings.arguments as Status; // Extract status from arguments
      return MaterialPageRoute(
        builder: (context) => StatusScreen(
          status: status,
        ), // Build and return the status screen with provided status
      );
    case CreateGroupScreen
          .routeName: // If the requested route is for the create group screen
      return MaterialPageRoute(
        builder: (context) =>
            const CreateGroupScreen(), // Build and return the create group screen
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
              error:
                  'This page doesn\'t exist'), // Build and return an error screen for unknown routes
        ),
      );
  }
}
