part of 'city_list_cubit.dart';

abstract class CityListState extends Equatable {
  const CityListState();

  @override
  List<Object> get props => [];
}

class CityListInitial extends CityListState {}

class CityListLoading extends CityListState {}

class CityListLoaded extends CityListState {
  final List<City> cities;

  CityListLoaded({required this.cities});

  @override
  List<Object> get props => [cities];
}

class CityListError extends CityListState {
  final String message;

  CityListError(this.message);

  @override
  List<Object> get props => [message];
}
