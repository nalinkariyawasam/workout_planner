import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseImageUrl;
  final int noOfminuites;
  final bool isAdded;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavExercise;
  final bool isFavourite;

  const AddExerciseCard({
    super.key,
    required this.exerciseTitle,
    required this.exerciseImageUrl,
    required this.noOfminuites,
    required this.toggleAddExercise,
    required this.isAdded,
    required this.toggleAddFavExercise,
    required this.isFavourite,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kCardBgColor,
        boxShadow: const [
          BoxShadow(
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
            Text(
              widget.exerciseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exerciseImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.noOfminuites.toString()} Minuites",
              style: const TextStyle(
                fontSize: 16,
                color: kSubtitleColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddExercise();
                      },
                      icon: Icon(
                        widget.isAdded ? Icons.remove : Icons.add,
                        size: 30,
                        color: kMainDarkBlueColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.2),
                    ),
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddFavExercise();
                      },
                      icon: Icon(
                      widget.isAdded? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: kMainPinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
