abstract class Substance {
  Substance({
    required this.name,
    required this.ingredients,
    required this.dateTime,
    this.duration = 10,
  });

  String name;
  List<String> ingredients = [];
  DateTime dateTime = DateTime.now();
  int duration;

  @override
  String toString() {
    return """
    String $name,
    Ingredients: $ingredients, 
    DateTime: $dateTime
    Duration: $duration""";
  }
}
