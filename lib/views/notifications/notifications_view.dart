import 'package:day_task/constants.dart';
import 'package:day_task/models/notification_model.dart';
import 'package:day_task/widgets/notifications/notifications_list.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        NotificationsList(
          notifications: [
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '2 mins',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '2 mins',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '2 mins',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '2 mins',
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Earlier',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        NotificationsList(
          notifications: [
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '4 hours',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '4 hours',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '4 hours',
            ),
            NotificationModel(
              ownerName: 'John Doe',
              ownerImage: 'assets/images/profile.png',
              action: 'added a new task',
              taskName: 'Task 1',
              time: '4 hours',
            ),
          ],
        ),
      ],
    );
  }
}
