import 'package:hive/hive.dart';

part 'intake.g.dart';

@HiveType(typeId: 4)
class Intake {
  Intake({
    required this.name,
    this.briefDescription,
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

  @HiveField(4)
  String? briefDescription;

  @override
  String toString() {
    return """
    String $name,
    Ingredients: $ingredients, 
    DateTime: $dateTime,
    Brief Description: $briefDescription,
    Duration: $duration""";
  }
}
