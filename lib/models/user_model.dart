import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;
  int totlaExercisesCompleted;
  int totlaEquipmentHandedOver;
  final List<Exercise> exerciseList;
  final List<Exercise> favExerciseList;
  final List<Equipment> equipmentList;
  final List<Equipment> favEquipmentList;

  User({
    required this.totlaExercisesCompleted,
    required this.totlaEquipmentHandedOver,
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.address,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favExerciseList,
    required this.favEquipmentList,
  });
  // methods

  // methode to add new exercise to the exerrcisList
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  // method to remove a exercise form the exercise list
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  // method to add new fac exercise to the favExerciseList
  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  // method to remove from favexerciseList
  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  // method to add a new equpment to equipmentList
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove a equipment from the equipment list
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  // method to add an equipment to the equipment list
  void addFavEquipment(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  // method to remove an equipment from the equipment list
  void removeFavEquipment(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  //method to calculate the total minites sepnd
  int calculatrTotalMinitesSpent() {
    int totalMinitesSpent = 0;

    //loop througt the exerciselist and calculate the no of minites
    for (var exercise in exerciseList) {
      totalMinitesSpent += exercise.noOfMinuites;
    }
    //loop througt the equipmen and calculate the no of minites
    for (var equipment in equipmentList) {
      totalMinitesSpent += equipment.noOfminuites;
    }
    return totalMinitesSpent;
  }

  // method to mark as an exercise as completed
  void markExerciseAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);
    exercise.completed = true;
    //remove from the exercise list
    removeExercise(exercise);
    totlaExercisesCompleted++;
  }

  // method to mark an equipment as handed over
  void markAsHandOvered(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((equipment) => equipment.id == equipmentId);
    equipment.handOvered == true;

    //remove from the equipmentList
    removeEquipment(equipment);
    totlaEquipmentHandedOver++;
  }

  //method to calculate the total number of calories burned by the user
  double calculateTotalCaloriesBurned() {
    double totalCaloriesBorned = 0;

    for (var equipment in equipmentList) {
      totalCaloriesBorned *= equipment.noOfCalories;
    }
    // convert the totalcalories borned in to a value between 0 and 1
    if (totalCaloriesBorned > 0 && totalCaloriesBorned <= 10) {
      totalCaloriesBorned = totalCaloriesBorned / 10;
    }
    if (totalCaloriesBorned > 10 && totalCaloriesBorned <= 100) {
      totalCaloriesBorned = totalCaloriesBorned / 100;
    }
    if (totalCaloriesBorned > 100 && totalCaloriesBorned <= 1000) {
      totalCaloriesBorned = totalCaloriesBorned / 1000;
    }
    return totalCaloriesBorned;
  }
}
