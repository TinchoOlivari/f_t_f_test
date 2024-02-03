import 'package:f_t_f_test/helpers/date.dart';
import 'package:f_t_f_test/provider/commit_provider.dart';
import 'package:f_t_f_test/widgets/commit_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommitListPage extends StatefulWidget {
  const CommitListPage({super.key});

  @override
  State<CommitListPage> createState() => _CommitListPageState();
}

class _CommitListPageState extends State<CommitListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<CommitProvider>(context, listen: false).getCommitList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Commits"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CommitProvider>().getCommitList();
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Consumer<CommitProvider>(
        builder: (context, value, child) {
          final isLoading = value.isLoading;
          final error = value.error;
          final isError = value.isError;
          final commits = value.commitList;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (isError) {
            return Center(child: Text(error!));
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Padding(
                  padding: Theme.of(context).listTileTheme.contentPadding!,
                  child: const Divider(),
                );
              },
              itemCount: value.commitList.length,
              itemBuilder: (context, index) {
                final commit = commits[index];
                final message = commit.commit?.message ?? "";
                final sha = commit.sha?.substring(0, 7) ?? "";
                final author = commit.commit?.author?.name ?? "";
                final time = timeAgo(commit.commit!.committer!.date);
                final avatarUrl = commit.author?.avatarUrl ?? "";

                return CommitListTile(
                  message: message,
                  author: author,
                  time: time,
                  avatarUrl: avatarUrl,
                  sha: sha,
                );
              },
            );
          }
        },
      ),
    );
  }
}
