import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  final int? maxAvatars;
  final List<String> avatars;
  final Color borderColor;
  const AvatarList({
    super.key,
    required this.avatars,
    this.maxAvatars,
    this.borderColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: List.generate(
          maxAvatars != null && avatars.length > maxAvatars!
              ? maxAvatars!
              : avatars.length, (index) {
        if (maxAvatars != null &&
            index >= maxAvatars! - 1 &&
            index < avatars.length - 1) {
          debugPrint('Condition met, displaying more_horiz icon');
          return Positioned(
            left: (index) * 15.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.more_horiz,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
          );
        } else {
          debugPrint('Condition not met, displaying CircleAvatar');
          return Positioned(
            left: index * 15.0,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: borderColor,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage(avatars[index]),
              ),
            ),
          );
        }
      }),
    );
  }
}
