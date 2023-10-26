class Message {
  late String id; // Unique ID for each message
  late String senderId; // Sender's user ID
  late String receiverId; // Receiver's user ID
  late String content; // Message content
  late DateTime timestamp; // Timestamp when the message was sent

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });
}



