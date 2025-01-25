class NotificationModel {
  final String ownerName;
  final String ownerImage;
  final String action;
  final String taskName;
  final String time;

  NotificationModel(
      {required this.ownerName,
      required this.ownerImage,
      required this.action,
      required this.taskName,
      required this.time});
}
