

class NotificationModel {
  // final String name;
  final String notification;
  final bool isRequestAccepted;
  final bool hasLiked;
  final bool hasMentioned;
  final String? time; // Make the time property nullable

  NotificationModel({
    // required this.name,
    required this.notification,
    this.isRequestAccepted = false,
    this.hasLiked = false,
    this.hasMentioned = false,
    this.time, // Update the constructor parameter to match
  });
}

