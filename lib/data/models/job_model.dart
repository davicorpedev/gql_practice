import 'package:gql_app/domain/entities/job.dart';

class JobModel extends Job {
  JobModel({required String id, required String title})
      : super(id: id, title: title);

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(id: json["id"], title: json["title"]);
  }
}
