class ProfileModel {
  final String profileimage;
  final String name;
  final String dob;
  final location;

  final String bio;
  final String numberOfPosts;
  final String numberOfFollowers;
  final String numberOfFollowings;
  final List<String> posts;

  ProfileModel({
    required this.profileimage,
    required this.name,
    required this.dob,
    required this.location,
    required this.bio,
    required this.numberOfPosts,
    required this.numberOfFollowers,
    required this.numberOfFollowings,
    required this.posts,
  });
}
