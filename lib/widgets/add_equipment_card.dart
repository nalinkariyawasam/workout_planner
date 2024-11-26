import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfminuites;
  final double noOfCalories;
  final String equipmentDescription;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;
  final bool isAddEquipment;
  final bool isAddFavEquipment;

  const AddEquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentImageUrl,
    required this.noOfminuites,
    required this.noOfCalories,
    required this.equipmentDescription,
    required this.toggleAddEquipment,
    required this.isAddEquipment,
    required this.toggleAddFavEquipment,
    required this.isAddFavEquipment,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDeaultPadding,
          horizontal: kDeaultPadding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentDescription,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kMainDarkBlueColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time : ${widget.noOfminuites.toString()} min and ${widget.noOfCalories.toString()} calories buried",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kSubtitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                        widget.toggleAddEquipment();
                      },
                      icon: Icon(
                        widget.isAddEquipment ? Icons.remove : Icons.add,
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
                        widget.toggleAddFavEquipment();
                      },
                      icon: Icon(
                        widget.isAddFavEquipment
                            ? Icons.favorite
                            : Icons.favorite_border,
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
