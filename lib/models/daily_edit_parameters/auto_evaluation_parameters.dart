import 'package:hive/hive.dart';

part 'auto_evaluation_parameters.g.dart';

@HiveType(typeId: 11)
class AutoEvaluationParameter {
  AutoEvaluationParameter({this.sleep, this.mood, this.energy});

  @HiveField(0)
  double? sleep;

  @HiveField(1)
  double? mood;

  @HiveField(2)
  double? energy;

  @override
  String toString() {
    return """
  sleep: $sleep,
  mood: $mood,
  energy: $energy,

""";
  }
}
