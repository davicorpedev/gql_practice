import 'package:equatable/equatable.dart';
import 'package:gql_app/domain/entities/company.dart';

class Job extends Equatable {
  final String id;
  final String title;
  final String slug;
  final Company company;
  final String? description;
  final String? applyUrl;
  final bool? isPublished;
  final bool? isFeatured;
  final String? userEmail;
  final String? postedAt;

  Job({
    required this.id,
    required this.title,
    required this.slug,
    required this.company,
    this.description,
    this.applyUrl,
    this.isPublished,
    this.isFeatured,
    this.userEmail,
    this.postedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        company,
        description,
        applyUrl,
        isPublished,
        isFeatured,
        userEmail,
        postedAt,
      ];
}
