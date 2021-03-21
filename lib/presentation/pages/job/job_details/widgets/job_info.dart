import 'package:flutter/material.dart';
import 'package:gql_app/domain/entities/job.dart';

class JobInfo extends StatelessWidget {
  final Job job;

  const JobInfo({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text("Posting date"),
            subtitle: Text(job.postedAt!),
          ),
          ListTile(
            leading: job.company.logoUrl != null
                ? Image.network(job.company.logoUrl!)
                : null,
            title: Text(job.company.name),
            subtitle: Text(job.company.websiteUrl!),
          ),

          ListTile(
            title: Text("Apply here"),
            subtitle: Text(job.applyUrl!),
          ),
          ListTile(
            title: Text("Email"),
            subtitle: Text(job.userEmail ?? "Not found"),
          ),
          ListTile(
            title: Text("Description"),
            subtitle: Text(job.description!),
          ),
        ],
      ),
    );
  }
}
