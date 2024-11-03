import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/models/exercise_model.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDescription;
  final List<Exercise> exerciseList;

  const ExerciseDetailsPage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  //Date and  time Formatters
  final DateFormat formetter = DateFormat("EEEE, MMMM");
  final DateFormat dayFormat = DateFormat("dd");

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
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
              widget.exerciseTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
