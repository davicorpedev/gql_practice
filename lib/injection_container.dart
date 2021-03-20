import 'package:get_it/get_it.dart';
import 'package:gql_app/application/country/country_list/country_list_cubit.dart';
import 'package:gql_app/data/core/api_client/jobs_api_client.dart';
import 'package:gql_app/data/datasources/country/country_remote_data_source.dart';
import 'package:gql_app/domain/repositories/country/country_repository.dart';

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

  ///JobsApiClient
  sl.registerLazySingleton(() => JobsApiClient.create());
}
