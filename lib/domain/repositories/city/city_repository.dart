import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/city/city_remote_data_source.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/city.dart';

class CityRepository {
  final CityRemoteDataSource remoteDataSource;

  CityRepository({required this.remoteDataSource});

  Future<Either<Failure, List<City>>> getCitiesByCountry(String slug) async {
    try {
      final result = await remoteDataSource.getCitiesByCountry(slug);

      return Right(result);
    } on ApiException {
      return Left(ApiFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }
}
