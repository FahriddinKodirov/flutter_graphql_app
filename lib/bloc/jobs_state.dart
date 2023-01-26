part of 'jobs_bloc.dart';


@immutable
abstract class jobsState {}

class JobsLoadInProgress extends jobsState {}

class JobsLoadSuccess extends jobsState {
  JobsLoadSuccess(this.jobs);

  final List<CountryModel> jobs;
}

class JobsLoadFailure extends jobsState {}