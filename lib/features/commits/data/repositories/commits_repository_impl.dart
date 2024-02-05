import 'dart:io';

import 'package:f_t_f_test/core/resources/data_state.dart';
import 'package:f_t_f_test/features/commits/data/data_source/remote/github_api.dart';
import 'package:f_t_f_test/features/commits/data/models/models.dart';
import 'package:f_t_f_test/features/commits/domain/repositories/commits_repository.dart';

class CommitsRepositoryImpl implements CommitsRepository {
  final GithubApi githubApi;

  CommitsRepositoryImpl(this.githubApi);

  @override
  Future<DataState<List<CommitListModel>>> getAllCommits() async {
    try {
      final commits = await githubApi.getAllCommits();
      return DataSuccess(commits);
    } on HttpException catch (e) {
      return DataFailed(e);
    }
  }
}
