import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/country/queries/get_countries_query.dart';
import 'package:gql_app/data/models/country_model.dart';
import 'package:graphql/client.dart';

final getCountriesOptions = QueryOptions(document: gql(getCountriesQuery));

class CountryRemoteDataSource {
  final JobsApiClient apiClient;

  CountryRemoteDataSource({required this.apiClient});

  Future<List<CountryModel>> getCountries() async {
    final result = await apiClient.query(getCountriesOptions);

    if (result.hasException) {
      throw ApiException();
    }

    return result.data!["countries"]
        .map<CountryModel>((country) => CountryModel.fromJson(country))
        .toList();
  }
}
