import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/entities/no_params.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/use_cases/get_commits.dart';
import 'package:githubapp/presentation/blocs/commit_bloc/commit_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCommits extends Mock implements GetCommits {}

void main() {
  late MockGetCommits getCommits;
  late CommitBloc bloc;

  setUp(() {
    getCommits = MockGetCommits();
    bloc = CommitBloc(getCommits: getCommits);
  });

  test('initialState should be CommitInitial', () {
    expect(bloc.state, equals(CommitInitial()));
  });

  group('GetCommits', () {
    test(
        '''should emit [LoadingCommits, LoadedCommits] when data is gotten successfully''',
        () async {
      final List<Commit> commitsList = [];

      when(() => getCommits(NoParams()))
          .thenAnswer((_) async => Right(commitsList));

      final expected = [
        LoadingCommits(),
        LoadedCommits(commits: commitsList),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(OnGetCommits());
    });

    test('should emit [LoadingCommits, Error] when getting data fails',
        () async {
      when(() => getCommits(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        LoadingCommits(),
        Error(),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));

      bloc.add(OnGetCommits());
    });
  });
}
