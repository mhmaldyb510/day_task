import 'package:day_task/constants.dart';
import 'package:day_task/helpers/functions.dart';
import 'package:day_task/widgets/calender/day_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayCardsList extends StatefulWidget {
  const DayCardsList({super.key});

  @override
  State<DayCardsList> createState() => _DayCardsListState();
}

class _DayCardsListState extends State<DayCardsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int currentIndex = DateTime.now().day - 1;
      double screenWidth = MediaQuery.of(context).size.width;
      double itemWidth = 60; // Assuming each item is 60 pixels wide
      double offset =
          (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
      _scrollController.jumpTo(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: getDaysInMonth(
            DateTime.now().year,
            DateTime.now().month,
          ),
          itemBuilder: (context, index) {
            DateTime date = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              index + 1,
            );
            String dayName = DateFormat('EEEE').format(date);
            return DayCard(
              dayNumber: index + 1,
              day: dayName.substring(0, 3),
              backgroundColor:
                  index == DateTime.now().day - 1 ? kPrimaryColor : null,
              textColor: index == DateTime.now().day - 1 ? Colors.black : null,
            );
          },
        ),
      ),
    );
  }
}
