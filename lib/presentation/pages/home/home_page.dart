import 'package:flutter/material.dart';
import 'package:gql_app/presentation/pages/country/countries_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CountriesPage()));
              },
              child: Text("Search Job by location"),
            ),
          ),
        ],
      ),
    );
  }
}
