import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final bool newMessage;
  final String name;
  final String lastMessage;
  final String image;
  const ChatTile({
    super.key,
    this.newMessage = false,
    this.name = '',
    this.lastMessage = '',  this.image = 'assets/images/profile.png',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/chat_view', arguments: name),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading:  CircleAvatar(
          backgroundImage: AssetImage(
            image
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: kTextColor,
          ),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '32 min',
              style: TextStyle(
                color: newMessage ? Colors.white : Colors.white70,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            newMessage
                ? const CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 3,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
