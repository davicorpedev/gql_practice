import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/job/queries/get_job_details.dart';
import 'package:gql_app/data/datasources/job/queries/get_jobs_by_city_query.dart';
import 'package:gql_app/data/models/job_model.dart';
import 'package:graphql/client.dart';

class JobRemoteDataSource {
  final JobsApiClient apiClient;

  JobRemoteDataSource({required this.apiClient});

  Future<List<JobModel>> getJobsByCity(String slug) async {
    final result = await apiClient.query(getJobsByCityOptions(slug));

    if (result.hasException) {
      throw ApiException();
    }

    return result.data!["city"]["jobs"]
        .map<JobModel>((country) => JobModel.fromJson(country))
        .toList();
  }

  Future<JobModel> getJobDetails(String companySlug, String jobSlug) async {
    final result = await apiClient.query(getJobsDetails(companySlug, jobSlug));

    if (result.hasException) {
      throw ApiException();
    }

    return JobModel.fromJson(result.data!["job"]);
  }
}

QueryOptions getJobsByCityOptions(String slug) {
  return QueryOptions(
    document: gql(getJobsByCityQuery),
    variables: <String, dynamic>{'slug': slug},
  );
}

QueryOptions getJobsDetails(String companySlug, String jobSlug) {
  return QueryOptions(
    document: gql(getJobDetails),
    variables: <String, dynamic>{
      'companySlug': companySlug,
      "jobSlug": jobSlug,
    },
  );
}
