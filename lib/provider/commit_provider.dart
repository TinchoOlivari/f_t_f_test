import 'dart:io';

import 'package:f_t_f_test/models/commits_models.dart';
import 'package:f_t_f_test/services/commit_service.dart';
import 'package:flutter/material.dart';

class CommitProvider extends ChangeNotifier {
  final _commitService = CommitService();

  List<CommitList> _commitList = [];
  List<CommitList> get commitList => _commitList;

  String? _error;
  String? get error => _error;
  bool get isError => _error != null;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCommitList() async {
    _isLoading = true;
    notifyListeners();
    try {
      _isLoading = false;
      _commitList = await _commitService.listCommits();
    } on HttpException catch (e) {
      _isLoading = false;
      _error = e.message;
    }
    notifyListeners();
  }
}
