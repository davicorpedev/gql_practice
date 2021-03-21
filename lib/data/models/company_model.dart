import 'package:gql_app/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({
    required String id,
    required String name,
    required String slug,
    String? logoUrl,
    String? websiteUrl,
    String? twitter,
  }) : super(
          id: id,
          name: name,
          slug: slug,
          logoUrl: logoUrl,
          websiteUrl: websiteUrl,
          twitter: twitter,
        );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      logoUrl: json["logoUrl"],
      websiteUrl: json["websiteUrl"],
      twitter: json["twitter"],
    );
  }
}
