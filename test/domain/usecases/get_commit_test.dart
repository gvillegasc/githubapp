import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/usecases/get_commits.dart';
import 'package:githubapp/domain/usecases/usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/repositories_mock.dart';

void main() {
  late GithubRepositoryMock githubRepository;
  late GetCommits getCommits;

  setUp(() {
    githubRepository = GithubRepositoryMock();
    getCommits = GetCommits(githubRepository);
  });

  group('Get Commit', () {
    test('should get commit', () async {
      final List<Commit> commits = [];

      when(() => githubRepository.getCommits())
          .thenAnswer((_) async => Right(commits));

      final response = await getCommits(NoParams());

      expect(response, equals(Right(commits)));
      verify(githubRepository.getCommits);
      verifyNoMoreInteractions(githubRepository);
    });

    test('should get a server failure', () async {
      when(() => githubRepository.getCommits())
          .thenAnswer((_) async => Left(ServerFailure()));

      final response = await getCommits(NoParams());

      expect(response, equals(Left(ServerFailure())));
      verify(githubRepository.getCommits);
      verifyNoMoreInteractions(githubRepository);
    });
  });
}
