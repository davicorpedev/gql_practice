part of 'job_details_cubit.dart';

abstract class JobDetailsState extends Equatable {
  const JobDetailsState();

  @override
  List<Object> get props => [];
}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsLoading extends JobDetailsState {}

class JobDetailsLoaded extends JobDetailsState {
  final Job job;

  JobDetailsLoaded({required this.job});

  @override
  List<Object> get props => [job];
}

class JobDetailsError extends JobDetailsState {
  final String message;

  JobDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
