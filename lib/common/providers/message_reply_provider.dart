import 'package:flutter_riverpod/flutter_riverpod.dart'; // Flutter Riverpod for state management
import 'package:Priva/common/enums/message_enum.dart'; // Importing custom message enum

// Class representing a message reply
class MessageReply {
  final String message; // Content of the message
  final bool isMe; // Indicator if the message is sent by the user
  final MessageEnum messageEnum; // Enum representing the type of message

  // Constructor for MessageReply
  MessageReply(this.message, this.isMe, this.messageEnum);
}

// Provider for managing MessageReply state
final messageReplyProvider = StateProvider<MessageReply?>((ref) => null);
