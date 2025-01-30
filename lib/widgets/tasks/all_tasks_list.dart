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
      itemCount: widget.task.completed.length + widget.task.notCompleted.length,
      itemBuilder: (context, index) {
        var all = widget.task.completed + widget.task.notCompleted;
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: ListTile(
            tileColor: const Color(0xff465a65),
            title: Text(
              all[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.task.completed.contains(all[index])) {
                    widget.task.notCompleted.add(all[index]);
                    widget.task.completed.remove(all[index]);
                  } else {
                    widget.task.completed.add(all[index]);
                    widget.task.notCompleted.remove(all[index]);
                  }
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
                  widget.task.completed.contains(all[index])
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
