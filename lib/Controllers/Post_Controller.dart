
import 'package:get/get.dart';

class PostController extends GetxController {
  final RxInt likes = 0.obs;
  final RxInt comments = 0.obs;

  void incrementLikes() {
    likes.value++;
  }

  void incrementComments() {
    comments.value++;
  }
}

class Post {
  final String name;
  final String post;
  final String profilepic;
  final String caption;
  final String timestamp;
  final String likes;
  final String comeents;
  final bool postsaved;
   List<String> hashtags=[];


  final PostController controller = PostController();

  Post({
    required this.name,
    required this.post,
    required this.profilepic,
    required this.caption,
    required this.timestamp,
    required this.likes,
    required this.comeents,
    required this.postsaved,

    required this.hashtags,


  });
}
