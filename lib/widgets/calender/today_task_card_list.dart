import 'package:day_task/widgets/calender/today_task_card.dart';
import 'package:flutter/material.dart';

class TodayTaskCardList extends StatelessWidget {
  const TodayTaskCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return TodayTaskCard(
            isFirst: index == 0,
            title: 'User Interface',
            startingTime: '2:00',
            endingTime: '3:30',
            collaborators: const [
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
              'assets/images/profile.png',
            ]);
      },
    );
  }
}
