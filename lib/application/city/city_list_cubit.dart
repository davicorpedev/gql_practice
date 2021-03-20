import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/city.dart';
import 'package:gql_app/domain/repositories/city/city_repository.dart';

part 'city_list_state.dart';

class CityListCubit extends Cubit<CityListState> {
  final CityRepository repository;

  CityListCubit({required this.repository}) : super(CityListInitial());

  Future<void> getCitiesByCountry(String slug) async {
    emit(CityListLoading());

    final result = await repository.getCitiesByCountry(slug);

    result.fold(
      (failure) {
        emit(CityListError(mapFailureToMessage(failure)));
      },
      (cities) {
        emit(CityListLoaded(cities: cities));
      },
    );
  }
}
