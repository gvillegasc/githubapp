import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/presentation/blocs/commit_bloc.dart';
import 'package:githubapp/presentation/ui/widgets/sliver_loading.dart';
import 'package:provider/provider.dart';

class CommitList extends StatefulWidget {
  @override
  _CommitListState createState() => _CommitListState();
}

class _CommitListState extends State<CommitList> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CommitBloc>();
    bloc.loadCommits();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommitBloc>(
      builder: (_, bloc, __) {
        switch (bloc.commitState) {
          case CommitState.loading:
            return SliverLoading();
          case CommitState.loaded:
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, int i) => Container(
                        child: Text(
                          bloc.commits[i].commit.author.name,
                          style: TextStyle(color: AppColors.white100),
                        ),
                      ),
                  childCount: bloc.commits.length),
            );
          default:
            return SliverLoading();
        }
      },
    );
  }
}
