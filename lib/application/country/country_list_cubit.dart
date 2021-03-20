import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/country.dart';
import 'package:gql_app/domain/repositories/country/country_repository.dart';

part 'country_list_state.dart';

class CountryListCubit extends Cubit<CountryListState> {
  final CountryRepository repository;

  CountryListCubit({required this.repository}) : super(CountryListInitial());

  Future<void> getCountries() async {
    emit(CountryListLoading());

    final result = await repository.getCountries();

    result.fold(
      (failure) {
        emit(CountryListError(mapFailureToMessage(failure)));
      },
      (countries) {
        emit(CountryListLoaded(countries: countries));
      },
    );
  }
}
