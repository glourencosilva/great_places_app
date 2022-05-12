import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_app/model/place_location.dart';
import 'package:great_places_app/model/places.dart';
import 'package:uuid/uuid.dart';

class GreatPlacesProvider with ChangeNotifier {
  late final List<Places> _items = [];

  List<Places> get items => [..._items];

  void addPlace(String pickedTitle, File pickedImage) {
    const location = PlaceLocation(longitude: 0, latitude: 0, address: '');
    final newPlace = Places(
        id: const Uuid().v4(),
        title: pickedTitle,
        location: location,
        images: pickedImage);

    _items.add(newPlace);
    notifyListeners();
  }
}
