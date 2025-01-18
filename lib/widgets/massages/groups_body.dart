import 'package:day_task/widgets/massages/chat_tile.dart';
import 'package:flutter/material.dart';

class GroupsBody extends StatelessWidget {
  const GroupsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ChatTile(
        name: 'Flutter Community',
        lastMessage: 'lets build an app together',
        image: 'assets/images/flutter.png',
      ),
    );
  }
}
