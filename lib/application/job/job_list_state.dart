part of 'job_list_cubit.dart';

abstract class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

class JobListInitial extends JobListState {}

class JobListLoading extends JobListState {}

class JobListLoaded extends JobListState {
  final List<Job> jobs;

  JobListLoaded({required this.jobs});

  @override
  List<Object> get props => [jobs];
}

class JobListError extends JobListState {
  final String message;

  JobListError(this.message);

  @override
  List<Object> get props => [message];
}
