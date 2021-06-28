import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/domain/models/commit.dart';

abstract class CommitRepository {
  Future<Either<Failure, List<Commit>>> getCommits();
}
