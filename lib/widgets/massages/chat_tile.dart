import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
      title: Text(
        'Robert Williams',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        'Hello, how are you? I am fine. What about you?',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: kTextColor,
        ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '32 min',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 3,
          ),
        ],
      ),
    );
  }
}
