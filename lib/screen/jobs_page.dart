import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_app/bloc/jobs_bloc.dart';
import 'package:flutter_graphql_app/screen/in_size.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: Center(child: BlocBuilder<JobBloc, jobsState>(
        builder: (context, state) {
          if (state is JobsLoadInProgress) {
            return const CircularProgressIndicator();
          }
          if (state is JobsLoadSuccess) {
            return ListView.builder(
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                final job = state.jobs[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> InSide(index: index,)));
                  },
                  key: Key(job.native),
                  title: Text(job.name),
                  trailing: Text(job.emoji,style:const TextStyle(fontSize: 20),),
                );
              },
            );
          }
          return const Text('Oops something went wrong!');
        },
      )),
    );
  }
}
