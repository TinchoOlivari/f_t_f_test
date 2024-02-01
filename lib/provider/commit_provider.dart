import 'package:f_t_f_test/models/commits_models.dart';
import 'package:f_t_f_test/services/commit_service.dart';
import 'package:flutter/material.dart';

class CommitProvider extends ChangeNotifier {
  final _commitService = CommitService();
  List<CommitList> _commitList = [];
  List<CommitList> get commitList => _commitList;

  Future<void> getCommitList() async {
    _commitList = await _commitService.listCommits();
    notifyListeners();
  }
}
