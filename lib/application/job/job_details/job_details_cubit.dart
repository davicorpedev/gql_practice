import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gql_app/domain/core/error/failures.dart';
import 'package:gql_app/domain/entities/job.dart';
import 'package:gql_app/domain/repositories/job/job_repository.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final JobRepository repository;

  JobDetailsCubit({required this.repository}) : super(JobDetailsInitial());

  Future<void> getDetails(String companySlug, String jobSlug) async {
    emit(JobDetailsLoading());

    final result = await repository.getJobDetails(companySlug, jobSlug);

    result.fold(
      (failure) {
        emit(JobDetailsError(mapFailureToMessage(failure)));
      },
      (job) {
        emit(JobDetailsLoaded(job: job));
      },
    );
  }
}
