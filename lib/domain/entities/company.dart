import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String? logoUrl;
  final String? websiteUrl;
  final String? twitter;

  Company({
    required this.id,
    required this.name,
    required this.slug,
    this.logoUrl,
    this.websiteUrl,
    this.twitter,
  });

  @override
  List<Object?> get props => [id, name, slug, logoUrl, websiteUrl, twitter];
}
