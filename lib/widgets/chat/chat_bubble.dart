import 'package:day_task/constants.dart';
import 'package:day_task/helpers/functions.dart';
import 'package:day_task/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  const ChatBubble({super.key, required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isMe ? kPrimaryColor : const Color(0xff273238),
        borderRadius: BorderRadius.zero,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message.message,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            getDifferenceBetweenTwoDates(
              message.time!,
              DateTime.now(),
            ),
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
