import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/models/user_model.dart';

User user = User(
  userId: "123456",
  fullName: "John Doe",
  age: 30,
  gender: "Male",
  address: "123 Main St, City, Country",
  description: "Fitness enthusiast",
  totlaExercisesCompleted: 0,
  totlaEquipmentHandedOver: 0,
  exerciseList: [
    Exercise(
      id: 0,
      exerciseName: "Fitness",
      exerciseImageUrl: "assets/images/exercises/fitness.png",
      noOfMinuites: 10,
      completed: false,
    ),
    Exercise(
      id: 1,
      exerciseName: "Push-Ups",
      exerciseImageUrl: "assets/images/exercises/pullups.png",
      noOfMinuites: 8,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of dumbbells for strength training exercises.",
      equipmentImageUrl: "assets/images/equipments/calendar.png",
      noOfminuites: 30,
      noOfCalories: 2,
      handOvered: false,
    ),
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercises.",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfminuites: 20,
      handOvered: false,
      noOfCalories: 15,
    ),
  ],
  favExerciseList: [
    Exercise(
      id: 3,
      exerciseName: "Skipping-Rope",
      exerciseImageUrl: "assets/images/exercises/skipping-rope.png",
      noOfMinuites: 15,
      completed: false,
    ),
  ],
  favEquipmentList: [
    Equipment(
      id: 3,
      equipmentName: "Jump Rope",
      equipmentDescription:
          "A rope used for cardiovascular exercises and coordination training.",
      equipmentImageUrl: "assets/images/equipments/dumbbells.png",
      noOfminuites: 15,
      handOvered: false,
      noOfCalories: 12,
    ),
  ],
);
