import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_app/api/api.dart';
import 'package:flutter_graphql_app/bloc/jobs_bloc.dart';
import 'package:flutter_graphql_app/screen/jobs_page.dart';

void main() {
  runApp(MyApp(jonbsApiClient: JonbsApiClient.create()));
}

class MyApp extends StatelessWidget {
  final JonbsApiClient jonbsApiClient;

  const MyApp({super.key, required this.jonbsApiClient});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
         create: (_) => JobBloc(
          jonbsApiClient: jonbsApiClient
         )..add(JobsFetchStarted()),
         child: const JobsPage()
         
         ),
    );
  }
}


