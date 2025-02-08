import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class AddMemberTile extends StatelessWidget {
  const AddMemberTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
      height: 38,
      decoration: const BoxDecoration(
        color: kSecondaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
          ),
          const CircleAvatar(
            radius: 11,
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            'Robert',
            style: kPrimaryTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
