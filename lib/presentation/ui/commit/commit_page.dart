import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/blocs/commit_bloc.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_header.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_list.dart';
import 'package:provider/provider.dart';

class CommitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<CommitBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.black70,
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [CommitHeader(), CommitList()],
          ),
        ),
      ),
    );
  }
}
