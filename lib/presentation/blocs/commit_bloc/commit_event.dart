part of 'commit_bloc.dart';

@immutable
abstract class CommitEvent extends Equatable {
  const CommitEvent();

  @override
  List<Object> get props => [];
}

class OnGetCommits extends CommitEvent {}
