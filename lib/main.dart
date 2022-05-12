import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places_provider.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: PlacesListScreen.routeName,
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          PlacesListScreen.routeName: (context) => const PlacesListScreen(),
        },
      ),
    );
}
