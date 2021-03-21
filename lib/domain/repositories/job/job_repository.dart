import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gql_app/data/core/error/exceptions.dart';
import 'package:gql_app/data/datasources/job/job_remote_data_source.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/job.dart';

class JobRepository {
  final JobRemoteDataSource remoteDataSource;

  JobRepository({required this.remoteDataSource});

  Future<Either<Failure, List<Job>>> getJobsByCity(String slug) async {
    try {
      final result = await remoteDataSource.getJobsByCity(slug);

      return Right(result);
    } on ApiException {
      return Left(ApiFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Job>> getJobDetails(
    String companySlug,
    String jobSlug,
  ) async {
    try {
      final result = await remoteDataSource.getJobDetails(companySlug, jobSlug);

      return Right(result);
    } on ApiException {
      return Left(ApiFailure());
    } on SocketException {
      return Left(NetworkFailure());
    }
  }
}
