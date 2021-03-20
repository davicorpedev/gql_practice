const String getCitiesByCountryQuery = r'''
  query ($slug: String!) {
    country(input: {slug: $slug}) {
      cities{id, name, slug}
    }
  }
''';