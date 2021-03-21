
const String getJobsByCityQuery = r'''
  query ($slug: String!){
    city(input:{slug: $slug}){
      jobs {
        id, 
        title, 
        slug, 
        company {id, name, slug}}
    }
  }
''';
