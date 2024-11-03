class Equipment {
  final int id;
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfminuites;
  final double noOfCalories;
  final bool handOvered;

  Equipment({
    required this.id,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfminuites,
    required this.noOfCalories,
    required this.handOvered,
  });
}
