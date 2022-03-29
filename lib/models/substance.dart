import 'package:hive/hive.dart';

part 'substance.g.dart';

@HiveType(typeId: 4)
class Substance {
  Substance({
    required this.name,
    required this.ingredients,
    required this.dateTime,
    this.duration = 10,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  List<String> ingredients = [];

  @HiveField(2)
  DateTime dateTime = DateTime.now();

  @HiveField(3)
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
