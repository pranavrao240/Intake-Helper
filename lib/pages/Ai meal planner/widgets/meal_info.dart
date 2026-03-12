class MealInfo {
  final String name;
  final String mealType;
  final String quantity;
  final double calories;
  final double protein;
  final double carbs;
  final String mealImage;

  const MealInfo({
    required this.name,
    required this.mealImage,
    required this.mealType,
    required this.quantity,
    required this.calories,
    required this.protein,
    required this.carbs,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealInfo && name == other.name && mealType == other.mealType;

  @override
  int get hashCode => name.hashCode ^ mealType.hashCode;
}
