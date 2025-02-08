import 'package:day_task/constants.dart';
import 'package:day_task/widgets/misc/custom_button.dart';
import 'package:day_task/widgets/tasks/add_member_tile.dart';
import 'package:day_task/widgets/tasks/create_task_text_field.dart';
import 'package:day_task/widgets/tasks/date_selection_tile.dart';
import 'package:flutter/material.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({super.key});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _CreateTaskFormState extends State<CreateTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Task Title',
            style: kPrimaryTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          CreateTaskTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Task Title.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Task Details',
            style: kPrimaryTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          CreateTaskTextField(
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Task Details.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Add team members',
            style: kPrimaryTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width - 100,
                child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AddMemberTile(),
                      AddMemberTile(),
                      AddMemberTile(),
                    ]),
              ),
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: const BeveledRectangleBorder(),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Time & Date',
            style: kPrimaryTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DateSelectionTile(
                type: DateSelectionType.time,
              ),
              DateSelectionTile(
                type: DateSelectionType.date,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Add New',
              style: kPrimaryTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            },
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Create',
              style: kPrimaryTextStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
