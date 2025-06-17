import 'package:day_task/constants.dart';
import 'package:day_task/models/task_model.dart';
import 'package:flutter/material.dart';

class AllTasksList extends StatefulWidget {
  final TaskModel task;
  const AllTasksList({super.key, required this.task});

  @override
  State<AllTasksList> createState() => _AllTasksListState();
}

class _AllTasksListState extends State<AllTasksList> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.task.subTasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: ListTile(
            tileColor: const Color(0xff465a65),
            title: Text(
              widget.task.subTasks[index].title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),  ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  widget.task.subTasks[index].isCompleted =
                      !widget.task.subTasks[index].isCompleted;
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.rectangle,
                ),
                child: Icon(
                  widget.task.subTasks[index].isCompleted
                      ? Icons.check_circle_outline_rounded
                      : Icons.circle_outlined,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
