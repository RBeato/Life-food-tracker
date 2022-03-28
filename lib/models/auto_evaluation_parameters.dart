abstract class AutoEvaluationParameter {
  AutoEvaluationParameter({
    required this.date,
    required this.value,
  });

  DateTime date;
  int value;

  @override
  String toString() {
    return """
  date: $date,
  value: $value,
""";
  }
}
