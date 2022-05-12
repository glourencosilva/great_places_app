import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places_provider.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  static const routeName = 'places-list-screen';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Consumer<GreatPlacesProvider>(
          builder: (context, greatPlaces, ch) => greatPlaces.items.isEmpty
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].images),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    onTap: (){
                      // TODO: Ir para tela de detalhes
                    },
                  ),

                ),
          child: const Center(
            child: Text('Got no places yet, start adding some'),
          ),
        ),
      );
}
