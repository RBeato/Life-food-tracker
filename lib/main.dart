import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//TODO: In the settings the app will allow to choose food from varius types of diets (Paleo, Keto, Wahls...), etc..
//TODO: Allow data export to .xls or other file type
//TODO: Add safeArea
//TODO: Add will pop scope
//TODO: Recover data from .xls if unviolated
//TODO: review the way ref.read is used inside build. it shouldn't be used : https://riverpod.dev/docs/concepts/reading/
//TODO: To create CSV file we are going to use csv 5.0.0 package. PUb DEV
//TODO: Associate Routine model class items with images
//TODO: use Hive;
//TODO: Use https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md ??
//TODO: Possibility to edit the meditation, exercise, symptoms,supplement and medication items lits
//TODO: Add an alternate meal list with user specified items.
//TODO: Inserir reset button nas settings para apagar todos os dados e repor as listas de origem

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
