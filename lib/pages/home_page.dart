import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipments_page.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    return SafeArea(
      child: Scaffold(
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
                const Text(
                  "Today's Activity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseDetailsPage(
                                exerciseTitle: "Warmup",
                                exerciseDescription:
                                    "A period or act of preparation for a match, performance, or exercise session, involving gentle exercise or practice.",
                                exerciseList: exerciseList,
                              ),
                            ));
                      },
                      child: const ExerciseCard(
                        title: "Warmup",
                        imageUrl: "assets/images/exercises/pilates.png",
                        description: "see more",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquiomentDetailsPage(
                              equipmentTitle: "Equipment",
                              equipmentDescription:
                                  "A period or act of preparation for a match, performance, or exercise session, involving gentle exercise or practice.",
                              equipmentList: equipmentList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: "Equipment",
                        imageUrl: "assets/images/equipments/dumbbell.png",
                        description: "see more",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Excercise",
                              exerciseDescription:
                                  "A period or act of preparation for a match, performance, or exercise session, involving gentle exercise or practice.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: "Exercise",
                        imageUrl: "assets/images/exercises/pullups.png",
                        description: "see more",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Streching",
                              exerciseDescription:
                                  "A period or act of preparation for a match, performance, or exercise session, involving gentle exercise or practice.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: "Stretching",
                        imageUrl: "assets/images/equipments/dumbbells.png",
                        description: "see more",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
