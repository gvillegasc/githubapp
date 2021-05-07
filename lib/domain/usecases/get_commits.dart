import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/repository/github_repository.dart';
import 'package:githubapp/domain/usecases/usecase.dart';

class GetCommits implements UseCase<List<Commit>, NoParams> {
  GetCommits(this.repository);

  final GithubRepository repository;

  @override
  Future<Either<Failure, List<Commit>>> call(NoParams params) async {
    return await repository.getCommits();
  }
}
