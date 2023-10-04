class ProfileModel {
  String profileimage;
  String name;
  String bio;
  String numberOfPosts;
  String numberOfFollowers;
  String numberOfFollowings;
  List<String> posts = [];

  ProfileModel({
    required this.profileimage,

    required this.name,
    required this.bio,
    required this.numberOfPosts,
    required this.numberOfFollowers,
    required this.numberOfFollowings,
    required this.posts,
  });
}
