import 'package:gql_app/data/models/company_model.dart';
import 'package:gql_app/domain/entities/company.dart';
import 'package:gql_app/domain/entities/job.dart';

class JobModel extends Job {
  JobModel({
    required String id,
    required String title,
    required String slug,
    required Company company,
    String? description,
    String? applyUrl,
    bool? isFeatured,
    bool? isPublished,
    String? userEmail,
    String? postedAt,
  }) : super(
          id: id,
          title: title,
          company: company,
          slug: slug,
          description: description,
          applyUrl: applyUrl,
          isFeatured: isFeatured,
          isPublished: isPublished,
          userEmail: userEmail,
          postedAt: postedAt,
        );

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      company: CompanyModel.fromJson(json["company"]),
      description: json["description"],
      applyUrl: json["applyUrl"],
      isFeatured: json["isFeatured"],
      isPublished: json["isPublished"],
      userEmail: json["userEmail"],
      postedAt: json["postedAt"],
    );
  }
}
