import 'package:day_task/constants.dart';

import 'package:day_task/widgets/massages/chat_body.dart';

import 'package:day_task/widgets/massages/messages_view_button.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          centerTitle: true,
          backgroundColor: kBackgroundColor,
          floating: true,
          pinned: false,
          snap: true,
          elevation: 0,
          title: const Text(
            "Messages",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    MessageViewButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      title: 'Chat',
                      backgroundColor: _selectedIndex != 0
                          ? const Color(0xff273238)
                          : kPrimaryColor,
                      textColor:
                          _selectedIndex != 0 ? Colors.white : Colors.black,
                    ),
                    const Spacer(),
                    MessageViewButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      title: 'Groups',
                      backgroundColor: _selectedIndex != 1
                          ? const Color(0xff273238)
                          : kPrimaryColor,
                      textColor:
                          _selectedIndex != 1 ? Colors.white : Colors.black,
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                ChatBody(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.5,
              right: 20,
              top: 20,
              bottom: 100,
            ),
            child: MessageViewButton(
              title: 'Start Chat',
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
