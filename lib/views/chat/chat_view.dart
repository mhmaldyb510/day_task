import 'package:day_task/constants.dart';
import 'package:day_task/models/message_model.dart';
import 'package:day_task/widgets/chat/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String chatViewRoute = '/chat_view';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

final TextEditingController _controller = TextEditingController();

class _ChatViewState extends State<ChatView> {
  final _listController = ScrollController();
  late MessageModel newMessage;
  List<MessageModel> messages = [
    MessageModel(
      message: 'Everything is fine, thanks for asking',
      sender: 'mhmaldyb510@gmail.com',
      time: DateTime(2025, 1, 1, 9, 31, 40),
    ),
    MessageModel(
      message: 'Hello Man, how its going?',
      sender: 'amhmaldyb510@gmail.com',
      time: DateTime(2025, 1, 1, 9, 31, 2),
    ),
    MessageModel(
      message: 'Hello',
      sender: 'mhmaldyb510@gmail.com',
      time: DateTime(2025, 1, 1, 9, 30, 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _listController,
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                if (messages[index].sender ==
                    FirebaseAuth.instance.currentUser!.email) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: ChatBubble(
                      message: messages[index],
                      isMe: true,
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: ChatBubble(
                      message: messages[index],
                      isMe: false,
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controller,
                    minLines: 1,
                    maxLines: 5,
                    onChanged: (value) {
                      newMessage = MessageModel(
                          message: value,
                          sender: FirebaseAuth.instance.currentUser!.email!,
                          time: DateTime.now());
                    },
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: IconButton(
                          style: IconButton.styleFrom(
                            shape: const BeveledRectangleBorder(),
                          ),
                          onPressed: () {
                            _controller.clear();
                            setState(() {
                              messages.insert(0, newMessage);
                            });
                          },
                          icon: const Icon(
                            Icons.send_outlined,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      fillColor: const Color(0xff273238),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
