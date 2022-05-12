import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:great_places_app/model/place_location.dart';

class Places extends Equatable {

  const Places({
    required this.id,
    required this.title,
    required this.location,
    required this.images,
  });
  final String id;
  final String title;
  final PlaceLocation location;
  final File images;

  @override
  List<Object?> get props => [id, title, location, images];
}
