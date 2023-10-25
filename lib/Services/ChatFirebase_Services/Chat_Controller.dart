import 'package:get/get.dart';
import 'ChatMessage_Model.dart';
import 'Firebase_Service.dart';

class ChatController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  void sendMessage(String text, String senderId) {
    _firebaseService.sendMessage(text, senderId);
  }

  void listenToMessages() {
    _firebaseService.getMessagesStream().listen((querySnapshot) {
      messages.assignAll(querySnapshot.docs.map((doc) {
        return ChatMessage(
          id: doc.id,
          text: doc['text'],
          senderId: doc['senderId'],
          timestamp: doc['timestamp'],
        );
      }).toList());
    });
  }
}
