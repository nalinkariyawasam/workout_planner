import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/equipment_model.dart';

class EquiomentDetailsPage extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentDescription;
  final List<Equipment> equipmentList;
  const EquiomentDetailsPage({
    super.key,
    required this.equipmentTitle,
    required this.equipmentDescription,
    required this.equipmentList,
  });

  @override
  State<EquiomentDetailsPage> createState() => _EquiomentDetailsPageState();
}

class _EquiomentDetailsPageState extends State<EquiomentDetailsPage> {
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
              widget.equipmentTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDeaultPadding),
        child: Column(
          children: [
            Text(
              widget.equipmentDescription,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
