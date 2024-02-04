import 'dart:io';

import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';
import 'package:f_t_f_test/services/commit_service.dart';
import 'package:flutter/material.dart';

class CommitProvider extends ChangeNotifier {
  final _commitService = CommitService();

  List<CommitListEntity> _commitList = [];
  List<CommitListEntity> get commitList => _commitList;

  String? _error;
  String? get error => _error;
  bool get isError => _error != null;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCommitList() async {
    _isLoading = true;
    notifyListeners();
    try {
      _commitList = await _commitService.listCommits();
      _isLoading = false;
    } on HttpException catch (e) {
      _error = e.message;
      _isLoading = false;
    }
    notifyListeners();
  }
}
