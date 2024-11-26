import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/exercise_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  //Date and  time Formatters
  final DateFormat formetter = DateFormat("EEEE, MMMM");
  final DateFormat dayFormat = DateFormat("dd");

  //User Data
  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDeaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$formattedDate $formatterDay",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kSubtitleColor,
                ),
              ),
              Text(
                userData.fullName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kMainBlackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Here are all your favorited workouts",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: kMainColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDeaultPadding,
                  mainAxisSpacing: kDeaultPadding,
                ),
                itemCount: userData.favExerciseList.length,
                itemBuilder: (context, index) {
                  Exercise favExercise = userData.favExerciseList[index];
                  return Card(
                    color: kCardBgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(kDeaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            favExercise.exerciseName,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            favExercise.exerciseImageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            favExercise.noOfMinuites.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: kMainPinkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
