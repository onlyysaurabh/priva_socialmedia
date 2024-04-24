// ignore_for_file: use_build_context_synchronously

import 'dart:io'; // For file operations

import 'package:flutter/material.dart'; // Flutter material design components
import 'package:image_picker/image_picker.dart'; // Image picker package
import 'package:giphy_picker/giphy_picker.dart'; // Giphy picker package

// Function to show a snackbar with provided content
void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(fontSize: 18),
      ),
      duration: const Duration(seconds: 1), // Set the duration to 1 second
    ),
  );
}

// Function to pick an image from the gallery
Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage = await ImagePicker().pickImage(
        source:
            ImageSource.gallery); // Pick image from gallery using ImagePicker

    if (pickedImage != null) {
      image = File(pickedImage.path); // Convert picked image to File object
    }
  } catch (e) {
    showSnackBar(
        context: context,
        content: e.toString()); // Show snackbar if error occurs
  }
  return image; // Return the picked image file
}

// Function to pick a video from the gallery
Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickedVideo = await ImagePicker().pickVideo(
        source:
            ImageSource.gallery); // Pick video from gallery using ImagePicker

    if (pickedVideo != null) {
      video = File(pickedVideo.path); // Convert picked video to File object
    }
  } catch (e) {
    showSnackBar(
        context: context,
        content: e.toString()); // Show snackbar if error occurs
  }
  return video; // Return the picked video file
}

// Function to pick a GIF using GiphyPicker
Future<GiphyGif?> pickGIF(BuildContext context) async {
  GiphyGif? gif;
  try {
    gif = await GiphyPicker.pickGif(
      context: context, // Provide the context for GiphyPicker
      apiKey: 'pwXu0t7iuNVm8VO5bgND2NzwCpVH9S0F', // Giphy API key
    );
  } catch (e) {
    showSnackBar(
        context: context,
        content: e.toString()); // Show snackbar if error occurs
  }
  return gif; // Return the picked GIF
}
