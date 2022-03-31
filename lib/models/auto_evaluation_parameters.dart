import 'package:hive/hive.dart';

part 'auto_evaluation_parameters.g.dart';

@HiveType(typeId: 9)
class AutoEvaluationParameter {
  AutoEvaluationParameter({this.sleep, this.mood, this.energy});

  @HiveField(0)
  int? sleep;

  @HiveField(1)
  int? mood;

  @HiveField(2)
  int? energy;

  @override
  String toString() {
    return """
  sleep: $sleep,
  mood: $mood,
  energy: $energy,

""";
  }
}
