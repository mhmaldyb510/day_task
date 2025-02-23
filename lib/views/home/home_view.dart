import 'package:day_task/constants.dart';
import 'package:day_task/models/task_model.dart';
import 'package:day_task/widgets/tasks/completed_task_card.dart';
import 'package:day_task/widgets/tasks/task_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String homeViewRoute = '/home_view';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 12,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                          'Mohamed Naser',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, '/profile_view'),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: kTextColor,
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: kTextColor,
                          ),
                          filled: true,
                          fillColor: Color(0xff465a65),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Color(0xff1c262f),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(
                              color: Color(0xff1c262f),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                        fixedSize: WidgetStateProperty.all(
                          const Size(53, 53),
                        ),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.tune),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ongoing',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: TaskModel(
                          title: 'Task Management app with Flutter',
                          description:
                              'An advanced task management app with Flutter to manage projects and divide it into small tasks.',
                          startDate: DateTime.now(),
                          completed: [
                            'Home page',
                            'Calendar page',
                            'Messages page',
                            'Notifications page',
                            'Firebase authentication',
                            'on boarding',
                          ],
                          notCompleted: [
                            'Task info page',
                            'store Tasks in firebase',
                            'Massaging view',
                            'New Chat view',
                            'Create new project',
                            'Profile page',
                            'App Logic',
                          ],
                          collaborators: const [
                            'assets/images/profile.png',
                          ]),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CompletedTaskCard(
                    backgroundColor:
                        index == 0 ? kPrimaryColor : const Color(0xff465a65),
                    foregroundColor: index == 0 ? Colors.black : Colors.white,
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
