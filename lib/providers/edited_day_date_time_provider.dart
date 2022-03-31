import 'package:flutter_riverpod/flutter_riverpod.dart';

final editedDayDateTimeProvider =
    StateProvider<DateTime>((ref) => DateTime.now());
