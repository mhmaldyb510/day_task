import 'package:day_task/constants.dart';
import 'package:day_task/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const NotificationsList({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        dense: true,
        minVerticalPadding: 0,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            notifications[index].ownerImage,
          ),
        ),
        title: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${notifications[index].ownerName} ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: notifications[index].action,
                style: const TextStyle(
                  color: Color(0xff8ba9b9),
                ),
              ),
            ],
          ),
        ),
        subtitle: Text(
          notifications[index].taskName,
          maxLines: 1,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ),
        trailing: Text(
          notifications[index].time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
