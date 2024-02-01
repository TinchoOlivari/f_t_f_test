import 'package:f_t_f_test/provider/commit_provider.dart';
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
        title: const Text("Commit list"),
      ),
      body: Consumer<CommitProvider>(
        builder: (context, value, child) {
          final commits = value.commitList;

          return ListView.builder(
            itemCount: value.commitList.length,
            itemBuilder: (context, index) {
              final commit = commits[index];
              final message = commit.commit?.message ?? "";

              return ListTile(title: Text(message));
            },
          );
        },
      ),
    );
  }
}
