import 'package:f_t_f_test/core/resources/data_state.dart';
import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';

abstract class CommitsRepository {
  Future<DataState<List<CommitListEntity>>> getAllCommits();
}
