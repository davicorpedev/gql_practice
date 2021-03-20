const String getJobsByCityQuery = r'''
  query GetJobsByCity($slug: String!){
    city(input:{slug: $slug}){
      jobs {id, title}
    }
  }
''';
