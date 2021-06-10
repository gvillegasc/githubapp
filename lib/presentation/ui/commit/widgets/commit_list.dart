import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubapp/presentation/blocs/commit_bloc/commit_bloc.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_error.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_item.dart';
import 'package:githubapp/presentation/ui/widgets/sliver_loading.dart';
import 'package:provider/provider.dart';

class CommitList extends StatefulWidget {
  const CommitList({
    Key? key,
  }) : super(key: key);

  @override
  _CommitListState createState() => _CommitListState();
}

class _CommitListState extends State<CommitList> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CommitBloc>();
    bloc.add(LoadCommits());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommitBloc, CommitState>(builder: (context, state) {
      if (state is LoadingCommits) {
        return const SliverLoading();
      } else if (state is LoadedCommits) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
              (_, int i) => (i == state.commits.length - 1)
                  ? SafeArea(
                      top: false,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: CommitItem(commit: state.commits[i])),
                    )
                  : CommitItem(commit: state.commits[i]),
              childCount: state.commits.length),
        );
      } else {
        return const CommitError();
      }
    });
  }
}
