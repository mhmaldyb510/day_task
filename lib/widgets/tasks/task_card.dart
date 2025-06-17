import 'package:day_task/models/task_model.dart';
import 'package:day_task/views/tasks/task_details.dart';
import 'package:day_task/widgets/tasks/task_progress_indicator.dart';
import 'package:day_task/widgets/tasks/avatar_list.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetails(task: task),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        height: 110,
        decoration: const BoxDecoration(
          color: Color(0xff465a65),
        ),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
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
                        avatars: task.collaborators,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Due on: ${task.startDate.day}/${task.startDate.month}/${task.startDate.year}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                TaskProgressIndicator(
                  progressValue: (task.subTasks
                              .where((element) => element.isCompleted)
                              .length /
                          (task.subTasks.length)) *
                      100,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
