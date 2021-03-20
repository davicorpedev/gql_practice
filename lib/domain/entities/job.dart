import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String id;
  final String title;

  Job({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
