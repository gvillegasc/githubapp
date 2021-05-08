import 'package:flutter/material.dart';
import 'package:githubapp/presentation/ui/commit/commit_page.dart';

class AppRoutes {
  static final String commit = '/commit';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.commit: (_) => CommitPage(),
};

final String appInitialRoute = AppRoutes.commit;
