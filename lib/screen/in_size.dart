import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_app/api/api.dart';
import 'package:flutter_graphql_app/bloc/jobs_bloc.dart';

class InSide extends StatelessWidget {
  final int index;

  const InSide({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobBloc(jonbsApiClient: JonbsApiClient.create())
        ..add(JobsFetchStarted()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detiled')),
        body: Center(child: BlocBuilder<JobBloc, jobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return const CircularProgressIndicator();
            }
            if (state is JobsLoadSuccess) {
              return SizedBox(
                height: height(context),
                width: width(context),
                child: Column(
                  children: [
                    SizedBox(
                      height: height(context) * 0.038,
                    ),
                    Text(
                      state.jobs[index].capital,
                      style: const TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: height(context) * 0.01,
                    ),
                    Container(
                      height: height(context) * 0.4,
                      width: width(context) * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black54)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'name:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45),
                                      ),
                                      Text(
                                        state.jobs[index].name,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    state.jobs[index].emoji,
                                    style: const TextStyle(fontSize: 72),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: height(context) * 0.02,
                              ),
                              const Text(
                                'nanativeme:',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black45),
                              ),
                              Text(
                                state.jobs[index].native,
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: height(context) * 0.02,
                              ),
                              const Text(
                                'laguage:',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black45),
                              ),

                              Row(
                                children: [
                                  const Text(
                                    'name:  ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  Text(
                                    state.jobs[index].languages[0].name,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'code:  ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black87),
                                  ),
                                  Text(
                                    state.jobs[index].languages[0].code,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: width(context)*0.6),
                                child: Text(
                                  state.jobs[index].currency,
                                  style: const TextStyle(fontSize: 26),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Text('Oops something went wrong!');
          },
        )),
      ),
    );
  }
}

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;
