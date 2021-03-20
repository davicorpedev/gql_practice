import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';
import 'package:gql_app/data/models/country_model.dart';
import 'package:graphql/client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'country_remote_data_source_test.mocks.dart';

@GenerateMocks([JobsApiClient])
void main() {
  late CountryRemoteDataSource dataSource;
  late MockJobsApiClient client;

  setUp(() {
    client = MockJobsApiClient();
    dataSource = CountryRemoteDataSource(apiClient: client);
  });

  group("getCountries", () {
    final tCountryModelList = [CountryModel(id: "test", name: "test")];

    test("should call the client and the query is getCountriesQuery", () async {
      when(client.query(any)).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: json.decode(fixture("countries.json")),
        ),
      );

      await dataSource.getCountries();

      verify(client.query(getCountriesOptions));
    });

    test("should return a List of Country when the request is successful",
        () async {
      when(client.query(any)).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          data: json.decode(fixture("countries.json")),
        ),
      );

      final result = await dataSource.getCountries();

      expect(result, tCountryModelList);
    });

    test("should return a ApiException if the request fails", () async {
      when(client.query(any)).thenAnswer(
        (realInvocation) async => QueryResult(
          source: QueryResultSource.network,
          exception: OperationException(),
        ),
      );

      final call = dataSource.getCountries;

      expect(() => call(), throwsA(isA<ApiException>()));
    });
  });
}
