import 'package:f_t_f_test/config.dart';
import 'package:f_t_f_test/models/commits_models.dart';
import 'package:http/http.dart' as http;

class CommitService {
  // https://docs.github.com/es/rest/commits/commits#list-commits
  Future<List<CommitList>> listCommits() async {
    const url = '${Config.baseUrl}/commits';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        return commitListFromJson(response.body);
      // case 400:
      //   throw "Bad Request";
      // case 404:
      //   throw "Resource not found";
      // case 409:
      //   throw "Conflict";
      // case 500:
      //  throw "Internal Error";
      default:
        throw "A problem occurred!";
    }
  }
}
