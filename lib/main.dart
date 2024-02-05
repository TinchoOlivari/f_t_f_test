import 'package:f_t_f_test/core/theme.dart';
import 'package:f_t_f_test/features/commits/data/data_source/remote/github_api.dart';
import 'package:f_t_f_test/features/commits/data/repositories/commits_repository_impl.dart';
import 'package:f_t_f_test/features/commits/domain/usecases/get_all_commits.dart';
import 'package:f_t_f_test/features/commits/presentation/pages/commit_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GetAllCommitsUseCase _getAllCharacters;

  @override
  void initState() {
    super.initState();
    final api = GithubApi();
    final repo = CommitsRepositoryImpl(api);

    _getAllCharacters = GetAllCommitsUseCase(repo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take-Home Test',
      theme: theme,
      home: MultiProvider(
        providers: [
          Provider.value(value: _getAllCharacters),
        ],
        child: const CommitListPage(),
      ),
    );
  }
}
