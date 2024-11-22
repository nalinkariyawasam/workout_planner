import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  const AddExerciseCard({super.key});

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kCardBgColor,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDeaultPadding),
        child: Column(
          children: [
            const Text(
              "Pushups",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/equipments/dumbbells.png",
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Pushups",
              style: TextStyle(
                fontSize: 16,
                color: kSubtitleColor,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor.withOpacity(0.2),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                      color: kMainDarkBlueColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
