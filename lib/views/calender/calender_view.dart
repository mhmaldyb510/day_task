import 'package:day_task/constants.dart';
import 'package:day_task/widgets/calender/day_cards_list.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            'Schedule',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_outlined,
                color: Colors.white,
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              DateFormat('MMMM').format(
                DateTime.now(),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        const DayCardsList()
        
      ],
    );
  }
}
