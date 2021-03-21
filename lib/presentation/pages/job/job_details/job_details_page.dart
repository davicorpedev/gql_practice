import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gql_app/application/job/job_details/job_details_cubit.dart';
import 'package:gql_app/domain/entities/job.dart';
import 'package:gql_app/injection_container.dart';
import 'package:gql_app/presentation/pages/job/job_details/widgets/job_info.dart';

class JobDetailsPage extends StatelessWidget {
  final Job job;

  const JobDetailsPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.title)),
      body: BlocProvider<JobDetailsCubit>(
        create: (_) =>
            sl<JobDetailsCubit>()..getDetails(job.company.slug, job.slug),
        child: BlocBuilder<JobDetailsCubit, JobDetailsState>(
          builder: (context, state) {
            if (state is JobDetailsLoaded) {
              return JobInfo(job: state.job);
            } else if (state is JobDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is JobDetailsError) {
              return Center(child: Text(state.message));
            }

            return Center(child: Text("Empty"));
          },
        ),
      ),
    );
  }
}
