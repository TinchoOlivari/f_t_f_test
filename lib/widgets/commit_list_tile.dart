import 'package:f_t_f_test/helpers/date.dart';
import 'package:flutter/material.dart';

class CommitListTile extends StatelessWidget {
  final String message;
  final String avatarUrl;
  final String author;
  final String daysAgo;

  const CommitListTile({
    super.key,
    required this.message,
    required this.avatarUrl,
    required this.author,
    required this.daysAgo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network(avatarUrl, width: 15, height: 15),
          Text(author),
        ],
      ),
      trailing: Text(daysAgo),
    );
  }
}
