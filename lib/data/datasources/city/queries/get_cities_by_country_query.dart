const String getCitiesByCountryQuery = r'''
  query GetCitiesByCountry($slug: String!) {
    country(input: {slug: $slug}) {
      cities{id, name, slug}
    }
  }
''';