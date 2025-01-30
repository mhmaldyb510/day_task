import 'package:day_task/constants.dart';
import 'package:day_task/models/task_model.dart';
import 'package:day_task/widgets/tasks/all_tasks_list.dart';
import 'package:day_task/widgets/tasks/task_progress_indicator.dart';
import 'package:day_task/widgets/tasks/avatar_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

const String taskDetailsViewRoute = '/task_details';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskModel task =
        ModalRoute.of(context)!.settings.arguments as TaskModel? ??
            TaskModel(startDate: DateTime.now());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Task Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Pilat Extended',
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Due Date',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '${task.startDate.day} ${DateFormat('MMMM').format(
                                  DateTime.now(),
                                ).substring(0, 4)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(
                          Icons.people_alt_outlined,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Project Members',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 40,
                            height: 16,
                            child: AvatarList(
                              avatars: task.collaborators,
                              maxAvatars: 3,
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Project Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    task.description,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Project Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      TaskProgressIndicator(
                        progressValue: (task.completed.length /
                                (task.completed.length +
                                    task.notCompleted.length)) *
                            100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          AllTasksList(task: task)
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff273238),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: const Text(
            'Add Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
