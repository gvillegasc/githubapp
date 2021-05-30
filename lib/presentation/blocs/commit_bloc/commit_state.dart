part of 'commit_bloc.dart';

@immutable
abstract class CommitState extends Equatable {
  const CommitState();

  @override
  List<Object> get props => [];
}

class CommitInitial extends CommitState {}

class LoadedCommits extends CommitState {
  final List<Commit> commits;

  LoadedCommits({required this.commits});

  @override
  List<Object> get props => [commits];
}

class LoadingCommits extends CommitState {}

class Error extends CommitState {}
