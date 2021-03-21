import 'package:graphql/client.dart';

class JobsApiClient {
  late final GraphQLClient _graphQLClient;

  JobsApiClient({required graphQLClient}) : _graphQLClient = graphQLClient;

  factory JobsApiClient.create() {
    final httpLink = HttpLink('https://api.graphql.jobs');
    final link = Link.from([httpLink]);

    return JobsApiClient(
      graphQLClient: GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }

  Future<QueryResult> query(QueryOptions options) async {
    return await _graphQLClient.query(options);
  }
}
