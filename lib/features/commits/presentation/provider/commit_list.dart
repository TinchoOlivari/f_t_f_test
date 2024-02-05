import 'package:f_t_f_test/core/resources/data_state.dart';
import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';
import 'package:f_t_f_test/features/commits/domain/usecases/get_all_commits.dart';
import 'package:flutter/material.dart';

enum CommitListStatus { initial, loading, success, failed }

class CommitListChangeNotifier extends ChangeNotifier {
  CommitListChangeNotifier({
    required GetAllCommitsUseCase getAllCommitsUseCase,
    String? errorMessage,
    CommitListStatus? initialStatus,
    List<CommitListEntity>? commitList,
  })  : _getAllCommitsUseCase = getAllCommitsUseCase,
        _status = initialStatus ?? CommitListStatus.initial,
        _errorMessage = errorMessage ?? '',
        _commitList = commitList ?? <CommitListEntity>[];

  final GetAllCommitsUseCase _getAllCommitsUseCase;

  CommitListStatus _status;
  CommitListStatus get status => _status;

  List<CommitListEntity> _commitList;
  List<CommitListEntity> get commitList => _commitList;

  String _errorMessage;
  String get errorMessage => _errorMessage;

  Future<void> getAllCommits() async {
    _status = CommitListStatus.loading;
    notifyListeners();

    final result = await _getAllCommitsUseCase.call();
    if (result is DataSuccess) {
      _commitList = result.data!;
      _status = CommitListStatus.success;
      notifyListeners();
    } else if (result is DataFailed) {
      _errorMessage = result.error!.message;
      _status = CommitListStatus.failed;
      notifyListeners();
    }
  }
}
