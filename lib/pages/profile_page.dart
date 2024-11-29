import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/pages/profile_card.dart';
import 'package:workout_planner/widgets/progress_cart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Date and  time Formatters
  final DateFormat formetter = DateFormat("EEEE, MMMM");
  final DateFormat dayFormat = DateFormat("dd");

  //User Data
  final userData = user;

  //exercise and equipment
  final exerciseList = ExerciesData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

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
                height: 20,
              ),
              ProgressCard(
                progressValue: userData.calculateTotalCaloriesBurned(),
                total: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kCardBgColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDeaultPadding * 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Minuites Spend: ${userData.calculatrTotalMinitesSpent().toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kMainDarkBlueColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Total Exersice Completed: ${userData.totlaExercisesCompleted.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kMainBlackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Total Equipment HandOver: ${userData.totlaEquipmentHandedOver.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kMainBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Your Exercises",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainDarkBlueColor),
              ),
              const SizedBox(
                height: 10,
              ),
              //exercisers list of the user
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: userData.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise userExercise = userData.exerciseList[index];

                  return ProfileCart(
                    taskName: userExercise.exerciseName,
                    taskImageUrl: userExercise.exerciseImageUrl,
                    markAsDone: () {
                      setState(() {
                        userData.markExerciseAsCompleted(userExercise.id);
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Your Equipment",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainDarkBlueColor),
              ),
              const SizedBox(
                height: 10,
              ),
              //equipment list of the user
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: userData.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment userEquipment = userData.equipmentList[index];

                  return ProfileCart(
                    taskName: userEquipment.equipmentName,
                    taskImageUrl: userEquipment.equipmentImageUrl,
                    markAsDone: () {
                      setState(() {
                        userData.markAsHandOvered(userEquipment.id);
                      });
                    },
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
