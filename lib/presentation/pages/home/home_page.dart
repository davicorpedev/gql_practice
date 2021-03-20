import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gql_app/application/country/country_list/country_list_cubit.dart';
import 'package:gql_app/injection_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
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
}
