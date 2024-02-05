import 'package:f_t_f_test/features/commits/data/models/models.dart';
import 'package:f_t_f_test/core/config.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class Api {
  Future<List<CommitListModel>> getAllCommits();
}

class GithubApi implements Api {
  @override
  Future<List<CommitListModel>> getAllCommits() async {
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
