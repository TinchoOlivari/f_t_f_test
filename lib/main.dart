import 'package:f_t_f_test/pages/commit_list_page.dart';
import 'package:f_t_f_test/provider/commit_provider.dart';
import 'package:f_t_f_test/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take-Home Test',
      theme: theme,
      home: ChangeNotifierProvider(
        create: (ctx) => CommitProvider(),
        child: const CommitListPage(),
      ),
    );
  }
}
