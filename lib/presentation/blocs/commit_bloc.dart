import 'package:flutter/material.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/usecases/get_commits.dart';
import 'package:githubapp/domain/usecases/usecase.dart';

enum CommitState { loading, loaded, errorService }

class CommitBloc extends ChangeNotifier {
  CommitBloc({required this.getCommits});
  final GetCommits getCommits;

  CommitState? _commitState;
  CommitState get commitState => _commitState!;

  List<Commit>? _commits;
  List<Commit> get commits => _commits!;

  Future<void> loadCommits() async {
    _commitState = CommitState.loading;
    final commitResponse = await getCommits(NoParams());
    commitResponse.fold((f) {
      _commitState = CommitState.errorService;
    }, (commits) {
      _commits = commits;
      _commitState = CommitState.loaded;
    });
    notifyListeners();
  }
}
