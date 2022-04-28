import 'package:hive/hive.dart';

part "activity.g.dart";

@HiveType(typeId: 0)
class Activity {
  Activity({
    this.title,
    this.briefDescription,
    required this.dateTime,
    required this.duration,
    required this.type,
    required this.quality,
  });

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? briefDescription;

  @HiveField(2)
  DateTime dateTime = DateTime.now();

  @HiveField(3)
  int duration;

  @HiveField(4)
  String? type;

  @HiveField(5)
  double? quality;

  @override
  String toString() {
    return """
    Title $title,
    briefDescription: $briefDescription, 
    DateTime: $dateTime,
    Duration: $duration,
    Type: $type,
    Quality: $quality,
    """;
  }
}
