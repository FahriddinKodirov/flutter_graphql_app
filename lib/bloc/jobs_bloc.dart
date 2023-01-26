import 'package:flutter_graphql_app/api/api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobBloc extends Bloc<JobsEvent, jobsState> {
   final JonbsApiClient _jobsApiClient;
 JobBloc({required JonbsApiClient jonbsApiClient})
   : _jobsApiClient = jonbsApiClient,
   super(JobsLoadInProgress()) {
    on<JobsFetchStarted>(_onJobsFetchStarted);
   }

   Future<void> _onJobsFetchStarted(JobsFetchStarted event, Emitter<jobsState> emit) async {
     emit(JobsLoadInProgress());
     try {
      final jobs = await _jobsApiClient.getJobs();
      emit(JobsLoadSuccess(jobs));
     } catch (error) {
      emit(JobsLoadFailure());
     }
   }

}