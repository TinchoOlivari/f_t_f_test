import 'dart:io';

import 'package:f_t_f_test/core/config.dart';
import 'package:f_t_f_test/features/commits/domain/entities/entities.dart';
import 'package:http/http.dart' as http;

class CommitService {
  // https://docs.github.com/es/rest/commits/commits#list-commits
  Future<List<CommitListEntity>> listCommits() async {
    const url = '${Config.baseUrl}/commits';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        return commitListFromJson(response.body);
      case 400:
        throw const HttpException("Bad Request");
      case 404:
        throw const HttpException("Repository not found");
      case 409:
        throw const HttpException("Repository in conflict");
      case 500:
        throw const HttpException("Internal Error");
      default:
        throw const HttpException("Unknown Error");
    }
  }
}
