import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //import the user from user data
  final userData = user;
  //exerciseList
  final exerciseList = ExerciesData().exerciseList;
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
              const SizedBox(
                height: 15,
              ),
              //list view to scro;; horizontally
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise exercise = exerciseList[index];
                    return AddExerciseCard(
                      exerciseTitle: exercise.exerciseName,
                      exerciseImageUrl: exercise.exerciseImageUrl,
                      noOfminuites: exercise.noOfMinuites,
                      isAdded: userData.exerciseList.contains(exercise),
                      isFavourite: userData.favExerciseList.contains(exercise),
                      toggleAddExercise: () {
                        setState(() {
                          if (userData.exerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                            print(userData.exerciseList.length);
                          } else {
                            userData.addExercise(exercise);
                            print(userData.exerciseList.length);
                          }

                          print(userData.exerciseList.last.exerciseName);
                        });
                      },
                      toggleAddFavExercise: () {
                        setState(() {
                          if (userData.favExerciseList.contains(exercise)) {
                            userData.removeExercise(exercise);
                            print(userData.favExerciseList.length);
                          } else {
                            userData.removeExercise(exercise);
                            print(userData.favExerciseList.length);
                          }
                        });
                      },
                    );
                    ;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
