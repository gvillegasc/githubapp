import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/usecases/get_commits.dart';
import 'package:githubapp/domain/usecases/usecase.dart';
import 'package:githubapp/presentation/blocs/commit_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCommits extends Mock implements GetCommits {}

void main() {
  late MockGetCommits getCommits;
  late CommitBloc commitBloc;

  setUp(() {
    getCommits = MockGetCommits();
    commitBloc = CommitBloc(getCommits: getCommits);
  });

  group('Commit Bloc', () {
    test('should get commits from use case', () async {
      final List<Commit> commitsList = [];

      when(() => getCommits(NoParams()))
          .thenAnswer((_) async => Right(commitsList));

      await commitBloc.loadCommits();

      expect(commitBloc.commitState, equals(CommitState.loaded));
      expect(commitBloc.commits, equals(commitsList));
    });

    test('should error service from use case', () async {
      when(() => getCommits(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));

      await commitBloc.loadCommits();

      expect(commitBloc.commitState, equals(CommitState.errorService));
    });
  });
}
