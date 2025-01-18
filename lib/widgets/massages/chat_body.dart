import 'package:day_task/widgets/massages/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ChatTile(),
    );
  }
}
