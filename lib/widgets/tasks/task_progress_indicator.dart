import 'package:day_task/constants.dart';
import 'package:flutter/material.dart';

class TaskProgressIndicator extends StatelessWidget {
  final double progressValue;
  const TaskProgressIndicator({super.key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: progressValue / 100, // Progress value (75%)
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(
              kPrimaryColor,
            ),
          ),
        ),
        Text(
          "${progressValue.toInt()}%",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
