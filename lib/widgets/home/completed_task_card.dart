import 'package:flutter/material.dart';

class CompletedTaskCard extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  const CompletedTaskCard({
    super.key,
    this.backgroundColor = const Color(0xff465a65),
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(),
      margin: const EdgeInsets.only(right: 8),
      color: backgroundColor,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 200,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Completed Task mockup',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: foregroundColor,
                fontFamily: 'Pilat Extended',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "Team members",
                  style: TextStyle(
                    fontSize: 12,
                    color: foregroundColor,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'to do: avatar list',
                  style: TextStyle(
                    fontSize: 12,
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 14,
                    color: foregroundColor,
                  ),
                ),
                Text(
                  "100%",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: foregroundColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
