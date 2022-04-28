import 'package:hive/hive.dart';

part 'symptom.g.dart';

@HiveType(typeId: 2)
class Symptom {
  @HiveField(0)
  List<String>? symptoms;

  @HiveField(1)
  double? symptomAverageSeverity;

  @HiveField(2)
  String? briefDescription = "Add more info!";

  Symptom({this.symptoms, this.symptomAverageSeverity, this.briefDescription});
}
