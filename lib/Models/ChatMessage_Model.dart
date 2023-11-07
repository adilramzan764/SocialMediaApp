class Message {
  late String id; // Unique ID for each message
  late String senderId; // Sender's user ID
  late String receiverId; // Receiver's user ID
  late String content; // Message content
  late DateTime timestamp; // Timestamp when the message was sent
  late String imageUrl; // Image URL

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    this.imageUrl = '', // Provide a default value here
  });
}



