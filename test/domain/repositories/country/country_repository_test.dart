import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';
import 'package:gql_app/data/models/country_model.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/repositories/country/country_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'country_repository_test.mocks.dart';

@GenerateMocks([CountryRemoteDataSource])
void main() {
  late CountryRepository repository;
  late MockCountryRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockCountryRemoteDataSource();
    repository = CountryRepository(remoteDataSource: remoteDataSource);
  });

  group("getCountries", () {
    final tCountryModelList = [CountryModel(id: "test", name: "test")];

    final tCountryList = tCountryModelList;

    test(
      "should return a List of Country when the request is successful",
      () async {
        when(remoteDataSource.getCountries())
            .thenAnswer((realInvocation) async => tCountryModelList);

        final result = await repository.getCountries();

        verify(remoteDataSource.getCountries());
        expect(result, Right(tCountryList));
      },
    );

    test("should return a ServerFailure when the request fails", () async {
      when(remoteDataSource.getCountries()).thenThrow(ServerException());

      final result = await repository.getCountries();

      expect(result, Left(ServerFailure()));
    });

    test("should return a NetworkFailure when the user has no internet",
        () async {
      when(remoteDataSource.getCountries()).thenThrow(SocketException(""));

      final result = await repository.getCountries();

      expect(result, Left(NetworkFailure()));
    });
  });
}
