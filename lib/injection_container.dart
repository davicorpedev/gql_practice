import 'package:get_it/get_it.dart';
import 'package:gql_app/application/city/city_list_cubit.dart';
import 'package:gql_app/application/country/country_list_cubit.dart';
import 'package:gql_app/application/job/job_details/job_details_cubit.dart';
import 'package:gql_app/application/job/job_list/job_list_cubit.dart';
import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/datasources/city/city_remote_data_source.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';
import 'package:gql_app/data/datasources/job/job_remote_data_source.dart';
import 'package:gql_app/domain/repositories/city/city_repository.dart';
import 'package:gql_app/domain/repositories/country/country_repository.dart';
import 'package:gql_app/domain/repositories/job/job_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Country
  //Cubit
  sl.registerFactory<CountryListCubit>(
      () => CountryListCubit(repository: sl()));

  //Repository
  sl.registerLazySingleton<CountryRepository>(
      () => CountryRepository(remoteDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSource(apiClient: sl()));

  ///Job
  //Cubit
  sl.registerFactory<JobListCubit>(() => JobListCubit(repository: sl()));
  sl.registerFactory<JobDetailsCubit>(() => JobDetailsCubit(repository: sl()));

  //Repository
  sl.registerLazySingleton<JobRepository>(
      () => JobRepository(remoteDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<JobRemoteDataSource>(
      () => JobRemoteDataSource(apiClient: sl()));

  ///City
  //Cubit
  sl.registerFactory<CityListCubit>(() => CityListCubit(repository: sl()));

  //Repository
  sl.registerLazySingleton<CityRepository>(
      () => CityRepository(remoteDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<CityRemoteDataSource>(
      () => CityRemoteDataSource(apiClient: sl()));

  ///JobsApiClient
  sl.registerLazySingleton(() => JobsApiClient.create());
}
