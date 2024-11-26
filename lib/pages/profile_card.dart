import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class ProfileCart extends StatefulWidget {
  final String taskName;
  final String taskImageUrl;
  final void Function() markAsDone;

  const ProfileCart(
      {super.key,
      required this.taskName,
      required this.taskImageUrl,
      required this.markAsDone});

  @override
  State<ProfileCart> createState() => _ProfileCartState();
}

class _ProfileCartState extends State<ProfileCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDeaultPadding),
        child: Row(
          children: [
            Image.asset(
              widget.taskImageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.taskName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                widget.markAsDone();
              },
              icon: const Icon(
                Icons.check,
                color: kMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
