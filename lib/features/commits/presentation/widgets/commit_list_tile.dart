import 'package:flutter/material.dart';

class CommitListTile extends StatelessWidget {
  final String message;
  final String avatarUrl;
  final String author;
  final String time;
  final String sha;

  const CommitListTile({
    super.key,
    required this.message,
    required this.avatarUrl,
    required this.author,
    required this.time,
    required this.sha,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                sha,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.network(
                  avatarUrl,
                  fit: BoxFit.fitWidth,
                  width: 15,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: child,
                      );
                    } else {
                      return Container();
                    }
                  },
                  errorBuilder: (_, __, ___) => Container(),
                ),
                Text(author),
              ],
            ),
          ],
        ),
      ),
      trailing: Text(time),
    );
  }
}
