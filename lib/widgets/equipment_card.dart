import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfminuites;
  final double noOfCalories;
  const EquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentDescription,
      required this.equipmentImageUrl,
      required this.noOfminuites,
      required this.noOfCalories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
      ),
      child: Column(
        children: [
          Text(
            equipmentName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                equipmentImageUrl,
                fit: BoxFit.cover,
                width: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "${noOfminuites.toString()} of Workout.",
                    style: const TextStyle(
                      color: kSubPinkColor,
                    ),
                  ),
                  Text(
                    "${noOfminuites.toString()} Calories Burned.",
                    style: const TextStyle(
                      color: kSubPinkColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            equipmentDescription,
          ),
        ],
      ),
    );
  }
}
