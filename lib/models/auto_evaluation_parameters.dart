import 'package:hive/hive.dart';

part 'auto_evaluation_parameters.g.dart';

@HiveType(typeId: 9)
class AutoEvaluationParameter {
  AutoEvaluationParameter({
    required this.date,
    required this.value,
  });

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int value;

  @override
  String toString() {
    return """
  date: $date,
  value: $value,
""";
  }
}
