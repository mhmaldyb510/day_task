import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final int dayNumber;
  final Color? backgroundColor;
  final Color? textColor;
  final String day;
  const DayCard({
    super.key,
    required this.dayNumber,
    this.backgroundColor,
    this.textColor, required this.day,
  });
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 60,
      width: 40,
      color: backgroundColor ?? const Color(0xff273238),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayNumber.toString(),
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
