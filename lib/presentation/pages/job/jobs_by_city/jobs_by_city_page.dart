import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gql_app/application/job/job_list/job_list_cubit.dart';
import 'package:gql_app/domain/entities/city.dart';
import 'package:gql_app/domain/entities/job.dart';
import 'package:gql_app/injection_container.dart';
import 'package:gql_app/presentation/pages/job/job_details/job_details_page.dart';

class JobListPage extends StatefulWidget {
  final City city;

  const JobListPage({Key? key, required this.city}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jobs")),
      body: BlocProvider<JobListCubit>(
        create: (context) =>
            sl<JobListCubit>()..getJobsByCity(widget.city.slug),
        child: BlocBuilder<JobListCubit, JobListState>(
          builder: (context, state) {
            if (state is JobListLoaded) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(state.jobs[index].title),
                    subtitle: Text(state.jobs[index].company.name),
                    onTap: () => navigate(state.jobs[index]),
                  );
                },
              );
            } else if (state is JobListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is JobListError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }

  void navigate(Job job) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobDetailsPage(job: job)),
    );
  }
}
