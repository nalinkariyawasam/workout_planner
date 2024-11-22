import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //import the user from user data
  final userData = user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDeaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello , ${userData.fullName}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "Lets add some workouts and Equipment for today",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kMainColor,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "All Exercises",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor,
                ),
              ),
              AddExerciseCard()
            ],
          ),
        ),
      ),
    );
  }
}
