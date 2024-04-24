import 'dart:io'; // For file operations
import 'package:firebase_storage/firebase_storage.dart'; // Firebase storage package
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Flutter Riverpod for state management

// Provider for CommonFirebaseStorageRepository
final commonFirebaseStorageRepositoryProvider = Provider(
  (ref) => CommonFirebaseStorageRepository(
    firebaseStorage:
        FirebaseStorage.instance, // Initializing with Firebase storage instance
  ),
);

// Class for common Firebase storage repository
class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage; // Firebase storage instance

  // Constructor for CommonFirebaseStorageRepository
  CommonFirebaseStorageRepository({
    required this.firebaseStorage,
  });

  // Function to store a file to Firebase storage and return the download URL
  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage
        .ref()
        .child(ref)
        .putFile(file); // Upload file to Firebase storage
    TaskSnapshot snap = await uploadTask; // Await upload task completion
    String downloadUrl =
        await snap.ref.getDownloadURL(); // Get download URL of uploaded file
    return downloadUrl; // Return download URL
  }
}
