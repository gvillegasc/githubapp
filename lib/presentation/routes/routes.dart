import 'package:flutter/material.dart';
import 'package:githubapp/presentation/ui/commit/commit_page.dart';

class AppRoutes {
  static const String commit = '/commit';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.commit: (_) => const CommitPage(),
};

const String appInitialRoute = AppRoutes.commit;
