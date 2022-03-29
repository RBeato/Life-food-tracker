import 'package:hive/hive.dart';
import 'package:lifestyle_tracker/models/daily_register.dart';

class Boxes {
  static Box<DailyRegister> getRegisters() =>
      Hive.box<DailyRegister>('registers');
}
