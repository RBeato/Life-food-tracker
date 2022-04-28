import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_page.dart';
import 'models/daily_edit_parameters/daily_register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(DailyRegisterAdapter());

  await Hive.openBox<DailyRegister>('registers');

  runApp(const ProviderScope(child: MyApp()));
}

//TODO: Get diets https://www.aconvert.com/document/ods-to-json/ **not completed

//TODO: In the settings the app will allow to choose food from various types of diets (Paleo, Keto, Wahls...), etc..
//TODO: Allow data export to .xls or other file type
//TODO: Add safeArea
//TODO: Add will pop scope
//TODO: Recover data from .xls if unviolated ???
//TODO: review the way ref.read is used inside build. it shouldn't be used : https://riverpod.dev/docs/concepts/reading/
//TODO: To create CSV file we are going to use csv 5.0.0 package. PUb DEV
//TODO: Associate Routine model class items with images
//TODO: use Hive;
//TODO: Use https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md ??
//TODO: Possibility to edit the meditation, exercise, symptoms,supplement and medication items lists
//TODO: Add an alternate meal list with user specified items. "Your Food List".
//TODO: Insert reset button in the settings page to erase all data and reset original lists
//TODO: Add carousels inside the daily_edit_page
//TODO: set max items selection in the daily_edit_page
//TODO: set max number of meals, snacks, drinks, and check date time conflits. Add pop-up
//TODO: set meal ingredients by colors.
//TODO: add textfield form to edit_page pop up

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
