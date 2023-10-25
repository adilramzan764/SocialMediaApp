import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _messageCollection =
  FirebaseFirestore.instance.collection('messages');

  Future<void> sendMessage(String text, String senderId) async {
    await _messageCollection.add({
      'text': text,
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return _messageCollection.orderBy('timestamp').snapshots();
  }
}
