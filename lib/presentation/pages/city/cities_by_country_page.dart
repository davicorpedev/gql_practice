import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gql_app/application/city/city_list_cubit.dart';
import 'package:gql_app/domain/entities/city.dart';
import 'package:gql_app/domain/entities/country.dart';
import 'package:gql_app/injection_container.dart';
import 'package:gql_app/presentation/pages/job/jobs_by_city_page.dart';

class CitiesByCountryPage extends StatefulWidget {
  final Country country;

  const CitiesByCountryPage({Key? key, required this.country})
      : super(key: key);

  @override
  _CitiesByCountryPageState createState() => _CitiesByCountryPageState();
}

class _CitiesByCountryPageState extends State<CitiesByCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cities")),
      body: BlocProvider<CityListCubit>(
        create: (context) =>
            sl<CityListCubit>()..getCitiesByCountry(widget.country.slug),
        child: BlocBuilder<CityListCubit, CityListState>(
          builder: (context, state) {
            if (state is CityListLoaded) {
              return ListView.builder(
                itemCount: state.cities.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.cities[index].name),
                    onTap: () {
                      navigate(state.cities[index]);
                    },
                  );
                },
              );
            } else if (state is CityListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CityListError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }

  void navigate(City city) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobListPage(city: city)),
    );
  }
}
