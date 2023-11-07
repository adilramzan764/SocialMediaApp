class ProfileModel {
  final String profileimage;
  late String name;
  final String dob;
  final location;

  late String bio;
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

  // Create a factory method to deserialize from a Map
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profileimage: json['profileimage'] ?? '',
      name: json['name'] ?? '',
      dob: json['dob'] ?? '',
      location: json['location'] ?? '',
      bio: json['bio'] ?? '',
      numberOfPosts: json['numberOfPosts'] ?? '',
      numberOfFollowers: json['numberOfFollowers'] ?? '',
      numberOfFollowings: json['numberOfFollowings'] ?? '',
      posts: List<String>.from(json['posts'] ?? []),
    );
  }

  // Create a method to serialize to a Map
  Map<String, dynamic> toJson() {
    return {
      'profileimage': profileimage,
      'name': name,
      'dob': dob,
      'location': location,
      'bio': bio,
      'numberOfPosts': numberOfPosts,
      'numberOfFollowers': numberOfFollowers,
      'numberOfFollowings': numberOfFollowings,
      'posts': posts,
    };
  }
}
