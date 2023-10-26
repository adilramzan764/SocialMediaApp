import 'package:cloud_firestore/cloud_firestore.dart';

import 'ChatMessage_Model.dart';

class FirebaseService {
  final CollectionReference messagesCollection =
  FirebaseFirestore.instance.collection('messages');

  Future<void> sendMessage(String senderId, String receiverId, String content) async {
    // Create a new message document in the 'messages' collection
    await messagesCollection.add({
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Message>> getMessageStream(String userId) {
    // Stream messages from Firebase database based on the user ID
    return messagesCollection
        .where('senderId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      // Parse each document into a Message object
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Message(
        id: doc.id,
        senderId: data['senderId'],
        receiverId: data['receiverId'],
        content: data['content'],
        timestamp: data['timestamp'].toDate(),
      );
    }).toList());
  }
}
