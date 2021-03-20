import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String id;
  final String name;
  final String slug;

  City({required this.id, required this.name, required this.slug});

  @override
  List<Object?> get props => [id, name, slug];
}
