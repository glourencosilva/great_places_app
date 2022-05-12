import 'package:equatable/equatable.dart';

class Places extends Equatable {
  final String id;
  final String title;
  final Object location;
  final Object images;

  const Places(
    this.id,
    this.title,
    this.location,
    this.images,
  );

  @override
  List<Object?> get props => [id, title, location, images];
}
