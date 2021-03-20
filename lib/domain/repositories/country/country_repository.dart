import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/country.dart';

class CountryRepository {
  final CountryRemoteDataSource remoteDataSource;

  CountryRepository({required this.remoteDataSource});

  Future<Either<Failure, List<Country>>> getCountries() async {
    try {
      final result = await remoteDataSource.getCountries();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }
}
