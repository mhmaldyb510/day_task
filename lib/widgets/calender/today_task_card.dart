import 'package:day_task/constants.dart';
import 'package:day_task/widgets/home/avatar_list.dart';
import 'package:flutter/material.dart';

class TodayTaskCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool isFirst;
  final String startingTime;
  final String endingTime;
  final List<String> collaborators;

  const TodayTaskCard({
    super.key,
    this.backgroundColor = const Color(0xff273238),
    required this.isFirst,
    required this.title,
    required this.startingTime,
    required this.endingTime,
    required this.collaborators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: isFirst ? 0 : 10,
            color: kPrimaryColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: isFirst ? kPrimaryColor : const Color(0xff273238),
            height: 70,
            width: isFirst
                ? MediaQuery.of(context).size.width - 40
                : MediaQuery.of(context).size.width - 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isFirst ? Colors.black : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$startingTime - $endingTime',
                      style: TextStyle(
                        color: isFirst ? Colors.black : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 24),

                  width: collaborators.length > 5
                      ? 75
                      : collaborators.length * 15, // 75 = maxAvatars*15
                  child: AvatarList(
                    borderColor: isFirst ? Colors.black : kPrimaryColor,
                    avatars: collaborators,
                    maxAvatars: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
