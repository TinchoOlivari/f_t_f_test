import 'package:f_t_f_test/core/resources/base_usecase.dart';
import 'package:f_t_f_test/core/resources/data_state.dart';
import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';
import 'package:f_t_f_test/features/commits/domain/repositories/commits_repository.dart';

class GetAllCommitsUseCase
    implements UseCase<DataState<List<CommitListEntity>>, void> {
  GetAllCommitsUseCase(commitsRepository)
      : _commitsRepository = commitsRepository;

  final CommitsRepository _commitsRepository;

  @override
  Future<DataState<List<CommitListEntity>>> call({void params}) {
    return _commitsRepository.getAllCommits();
  }
}
