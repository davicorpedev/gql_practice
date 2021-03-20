import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/job.dart';
import 'package:gql_app/domain/repositories/job/job_repository.dart';

part 'job_list_state.dart';

class JobListCubit extends Cubit<JobListState> {
  final JobRepository repository;

  JobListCubit({required this.repository}) : super(JobListInitial());

  Future<void> getJobsByCity(String slug) async {
    emit(JobListLoading());

    final result = await repository.getJobsByCity(slug);

    result.fold(
      (failure) {
        emit(JobListError(mapFailureToMessage(failure)));
      },
      (jobs) {
        emit(JobListLoaded(jobs: jobs));
      },
    );
  }
}
