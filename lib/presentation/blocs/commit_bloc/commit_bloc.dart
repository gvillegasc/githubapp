import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:githubapp/domain/entities/no_params.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/use_cases/get_commits.dart';

part 'commit_event.dart';
part 'commit_state.dart';

class CommitBloc extends Bloc<CommitEvent, CommitState> {
  CommitBloc({required this.getCommits}) : super(CommitInitial());

  final GetCommits getCommits;

  @override
  Stream<CommitState> mapEventToState(
    CommitEvent event,
  ) async* {
    if (event is LoadCommits) {
      yield* this._mapOnGetCommits(event);
    }
  }

  Stream<CommitState> _mapOnGetCommits(
    LoadCommits event,
  ) async* {
    yield LoadingCommits();
    final failureOrCommits = await getCommits(NoParams());
    yield failureOrCommits.fold(
      (failure) => Error(),
      (commits) => LoadedCommits(commits: commits),
    );
  }
}
