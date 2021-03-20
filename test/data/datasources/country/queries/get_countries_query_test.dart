import 'package:flutter_test/flutter_test.dart';
import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';

void main() {
  late JobsApiClient apiClient;

  setUp(() {
    apiClient = JobsApiClient.create();
  });

  test("should return a valid response", () async {
    final result = await apiClient.query(getCountriesOptions());

    expect(result.hasException, false);
    expect(result.data!.isNotEmpty, true);
  });
}
