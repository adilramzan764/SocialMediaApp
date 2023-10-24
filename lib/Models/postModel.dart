import '../Controllers/Post_Controller.dart';

class PostModel {
  final String name;
  final String post;
  final String profilepic;
  final String postpic;

  final String caption;
  final String timestamp;
  final String likes;
  final String comeents;
  final bool postsaved;
  List<String> hashtags=[];


  // final PostController controller = PostController();



  PostModel({
    required this.name,
    required this.post,
    required this.profilepic,
    required this.postpic,

    required this.caption,
    required this.timestamp,
    required this.likes,
    required this.comeents,
    required this.postsaved,

    required this.hashtags,


  });
}