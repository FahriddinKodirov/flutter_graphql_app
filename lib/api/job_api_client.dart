import 'package:flutter_graphql_app/api/models/countries.dart';
import 'package:graphql/client.dart';
import 'package:flutter_graphql_app/api/queries/queries.dart' as queries;

class GetJobsRequestFailure implements Exception {}

class JonbsApiClient {
  final GraphQLClient _graphQLClient;

   const JonbsApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory JonbsApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return JonbsApiClient(
      graphQLClient: GraphQLClient(link: link,cache:  GraphQLCache()));
  }

  Future<List<CountryModel>> getJobs() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getJobs)));
   
   if(result .hasException) throw GetJobsRequestFailure();
   final data = result.data?['countries'] as List;
   return data
         .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
         .toList();
  }
      
  }

