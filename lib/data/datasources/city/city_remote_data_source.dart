import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/city/queries/get_cities_by_country_query.dart';
import 'package:gql_app/data/models/city_model.dart';
import 'package:graphql/client.dart';

class CityRemoteDataSource {
  final JobsApiClient apiClient;

  CityRemoteDataSource({required this.apiClient});

  Future<List<CityModel>> getCitiesByCountry(String slug) async {
    final result = await apiClient.query(getCitiesByCountryOptions(slug));

    if (result.hasException) {
      throw ApiException();
    }

    return result.data!["country"]["cities"]
        .map<CityModel>((country) => CityModel.fromJson(country))
        .toList();
  }
}

QueryOptions getCitiesByCountryOptions(String slug) {
  return QueryOptions(
    document: gql(getCitiesByCountryQuery),
    variables: <String, dynamic>{'slug': slug},
  );
}
