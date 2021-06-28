import 'package:dartz/dartz.dart';
import 'package:githubapp/core/error/exceptions.dart';
import 'package:githubapp/core/error/failures.dart';
import 'package:githubapp/data/data_sources/remote_data_source.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/domain/repositories/commit_repository.dart';

class CommitRepositoryImpl implements CommitRepository {
  CommitRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Commit>>> getCommits() async {
    try {
      final userSelected = await remoteDataSource.getCommits();
      return Right(userSelected);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
