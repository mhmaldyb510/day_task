import 'package:day_task/constants.dart';
import 'package:day_task/widgets/tasks/create_task_form.dart';
import 'package:flutter/material.dart';

const String addTaskViewRoute = '/add_task_view';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Create New Task',
          style: kPrimaryTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            CreateTaskForm()
          ],
        ),
      ),
    );
  }
}
