import 'package:flutter/material.dart';

class CommitListTile extends StatelessWidget {
  final String message;
  final String avatarUrl;
  final String author;
  final String time;

  const CommitListTile({
    super.key,
    required this.message,
    required this.avatarUrl,
    required this.author,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Image.network(avatarUrl, width: 15, height: 15),
            ),
            Text(author),
          ],
        ),
      ),
      trailing: Text(time),
    );
  }
}
