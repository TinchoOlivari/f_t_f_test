import 'package:f_t_f_test/core/helpers/date.dart';
import 'package:f_t_f_test/features/commits/domain/usecases/get_all_commits.dart';
import 'package:f_t_f_test/features/commits/presentation/provider/commit_list.dart';
import 'package:f_t_f_test/features/commits/presentation/widgets/commit_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommitListPage extends StatelessWidget {
  const CommitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = context.read<GetAllCommitsUseCase>();
    return ChangeNotifierProvider(
      create: (_) => CommitListChangeNotifier(getAllCommitsUseCase: useCase),
      child: const CommitListView(),
    );
  }
}

class CommitListView extends StatefulWidget {
  const CommitListView({super.key});

  @override
  State<CommitListView> createState() => _CommitListViewState();
}

class _CommitListViewState extends State<CommitListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommitListChangeNotifier>().getAllCommits();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select((CommitListChangeNotifier c) => c.status);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Commits in Clean architecture"),
      ),
      body: ContentByStatus(status),
    );
  }
}

class ContentByStatus extends StatelessWidget {
  const ContentByStatus(this.status, {super.key});

  final CommitListStatus status;

  @override
  Widget build(BuildContext context) {
    if (status == CommitListStatus.success) {
      return const _Content();
    } else if (status == CommitListStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (status == CommitListStatus.failed) {
      return Center(
        child: Center(
          child: Text(
            context.read<CommitListChangeNotifier>().errorMessage,
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('Initial State'),
      );
    }
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommitListChangeNotifier>(
      builder: (context, value, child) {
        final commits = value.commitList;

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
      },
    );
  }
}
