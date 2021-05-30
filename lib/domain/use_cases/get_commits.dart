import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/entities/no_params.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/repository/commit_repository.dart';
import 'package:githubapp/domain/use_cases/use_case.dart';

class GetCommits implements UseCase<List<Commit>, NoParams> {
  GetCommits(this.repository);

  final CommitRepository repository;

  @override
  Future<Either<Failure, List<Commit>>> call(NoParams params) async {
    return await repository.getCommits();
  }
}
