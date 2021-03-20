import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gql_app/application/country/country_list_cubit.dart';
import 'package:gql_app/domain/entities/country.dart';
import 'package:gql_app/injection_container.dart';
import 'package:gql_app/presentation/pages/city/cities_by_country_page.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Countries")),
      body: BlocProvider<CountryListCubit>(
        create: (context) => sl<CountryListCubit>()..getCountries(),
        child: BlocBuilder<CountryListCubit, CountryListState>(
          builder: (context, state) {
            if (state is CountryListLoaded) {
              return ListView.builder(
                itemCount: state.countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.countries[index].name),
                    onTap: () {
                      navigate(state.countries[index]);
                    },
                  );
                },
              );
            } else if (state is CountryListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CountryListError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }

  void navigate(Country country) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CitiesByCountryPage(country: country)),
    );
  }
}
