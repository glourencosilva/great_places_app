import 'package:equatable/equatable.dart';

class PlaceLocation extends Equatable {

  const PlaceLocation(
      {required this.latitude, required this.longitude, required this.address});
  final double latitude;
  final double longitude;
  final String address;

  @override
  List<Object?> get props => [latitude, longitude, address];
}
