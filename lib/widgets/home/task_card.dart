import 'package:day_task/constants.dart';
import 'package:day_task/widgets/home/avatar_list.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: 110,
      decoration: const BoxDecoration(
        color: Color(0xff465a65),
      ),
      child: Column(
        children: [
          const Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Task Name',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Pilat Extended',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Team members',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width - 120,
                    child: AvatarList(
                      maxAvatars:
                          (MediaQuery.of(context).size.width - 120) ~/ 16,
                      avatars: const [
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                        'assets/images/profile.png',
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Due on: 12/12/2021',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: 0.75, // Progress value (75%)
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        kPrimaryColor,
                      ),
                    ),
                  ),
                  Text(
                    "75%",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
